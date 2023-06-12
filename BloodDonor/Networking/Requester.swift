import Foundation

class Requester {
 
    static let shared = Requester()

    private var accessToken = UserDefaultsWorker.shared.getAccessToken()

    
    private init() {}
    
    private func onTokensRefreshed(tokens: TokensInfo, userId: Int, displayName: String) {
        UserDefaultsWorker.shared.saveAuthTokens(tokens: tokens, userId: userId, displayName: displayName)
        accessToken = TokenInfo(token: tokens.token)
    }
    
    func dropTokens() {
        accessToken = TokenInfo(token: "")
    }
    
    private func formRequest(url: URL,
                     data: Data = Data(),
                     method: String = "POST",
                     contentType: String = "application/json",
                     ignoreJwtAuth: Bool = false) -> URLRequest {
        var request = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData
        )
        request.httpMethod = method
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        if !accessToken.token.isEmpty && !ignoreJwtAuth {
            request.addValue("Bearer \(accessToken.token)", forHTTPHeaderField: "Authorization")
            
        }
        return request
    }
    
    
    private func renewAuthHeader(request: URLRequest) -> URLRequest {
        var newRequest = request
        newRequest.setValue("Bearer \(accessToken.token)", forHTTPHeaderField: "Authorization")
        return newRequest
    }
    
    private func handleAuthResponse(response: Result<User>, onResult: @escaping (Result<User>) -> Void) {
        if case .success(let user) = response {
            let jwtToken = user.token
            if let userId = decodeJWTforUserID(jwtToken: jwtToken) {
                if let displayName = extractDisplayNameFromJWT(jwtToken: jwtToken) {
                    self.onTokensRefreshed(tokens: user.getTokensInfo(), userId: userId, displayName: displayName)
                } else {
                    // Handle the case when extracting the displayName from JWT fails
                    // Show an error message or handle the error appropriately
                }
            } else {
                // Handle the case when decoding the JWT for userId fails
                // Show an error message or handle the error appropriately
            }
        }
        onResult(response)
    }
    
    func register(authBody: RegisterBody, onResult: @escaping (Result<User>) -> Void) {
        let url = Endpoint.register.absoluteURL
        let body = try! JSONEncoder().encode(authBody)
        let request = formRequest(url: url, data: body, method: "POST", ignoreJwtAuth: true)
        self.doRequest(request: request) { [self] result in
            self.handleAuthResponse(response: result, onResult: onResult)
        }
    }
    
    func login(authBody: LoginBody, onResult: @escaping (Result<User>) -> Void) {
        let url = Endpoint.login.absoluteURL
        let body = try! JSONEncoder().encode(authBody)
        let request = formRequest(url: url, data: body, method: "POST", ignoreJwtAuth: true)
        self.doRequest(request: request) { [self] result in
            self.handleAuthResponse(response: result, onResult: onResult)
        }
    }
    
    func getBloodCenter(onResult: @escaping (Result<[BloodCenters]>) -> Void) {
        let url = Endpoint.bloodCenters.absoluteURL
        let request = formRequest(url: url, data: Data(), method: "GET")
        self.request(request: request, onResult: onResult)
    }
    
    
    func request<T: Decodable>(request: URLRequest, onResult: @escaping (Result<T>) -> Void) {
        print("request called")
        doRequest(request: request, onResult: onResult)
    }
    
    func doRequest<T: Decodable>(request: URLRequest, onResult: @escaping (Result<T>) -> Void) {
        print("do request \(request.url?.absoluteString ?? "")")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print("response error: ", error)
                DispatchQueue.main.async { onResult(.networkError(error.localizedDescription)) }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                //should never happen
                DispatchQueue.main.async { onResult(.networkError(Errors.ERR_CONVERTING_TO_HTTP_RESPONSE)) }
                return
            }
            
            guard let data = data else {
                //should never happen
                DispatchQueue.main.async {
                    onResult(.serverError(ErrorResponse(code: httpResponse.statusCode, message: Errors.ERR_NIL_BODY)))
                }
                return
            }
            print("respone code: \(httpResponse.statusCode)")
            if httpResponse.isSuccessful() {
                let responseBody: Result<T> = self.parseResponse(data: data)
                DispatchQueue.main.async { onResult(responseBody) }
            } else {
                let responseBody: Result<T> = self.parseError(data: data)
                DispatchQueue.main.async { onResult(responseBody) }
            }
        }
        task.resume()
    }
    
    private func parseResponse<T: Decodable>(data: Data) -> Result<T> {
        do {
            return .success(try JSONDecoder().decode(T.self, from: data))
        } catch {
            print("failed parsing successful response, parsing err: \(error)")
            return parseError(data: data)
        }
    }
    
    private func parseError<T>(data: Data) -> Result<T> {
        print("parsing error")
        do {
            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
            if (errorResponse.isAuth()) {
                return .authError(errorResponse)
            } else {
                return .serverError(errorResponse)
            }
        } catch {
            return .serverError(ErrorResponse(code: 0, message: Errors.ERR_PARSE_ERROR_RESPONSE))
        }
    }
    

}

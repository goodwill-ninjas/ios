//
//  AuthService.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 31/05/2023.
//

import Foundation
import Alamofire
// Define a class named AuthService.
class AuthService {
    private let httpService: AuthHttpService  // An instance of AuthHttpService used for HTTP requests.
    static let shared: AuthService = AuthService()  // A shared singleton instance of AuthService.
    
    // Private initializer to enforce the use of the shared singleton instance.
    private init(httpService: AuthHttpService = AuthHttpService()) {
        self.httpService = httpService
    }
}

// Extend the AuthService class to conform to the AuthAPI protocol.
extension AuthService: AuthAPI {
    // Function to perform a login request with the given email and password.
    func login(email: String, password: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        do {
            // Create a login request with the given email and password.
            try AuthHttpRouter
                .login(AuthModel(email: email, password: password))
                .request(usingHttpService: httpService)
                .responseJSON { (response) in
                    // Handle the response of the login request.
                    guard response.response?.statusCode == 200 else {
                        // Handle the case when the response status code is not 200.
                        if let data = response.data {
                            do {
                                // Decode the error response from JSON data.
                                let loginError = try JSONDecoder().decode(LoginError.self, from: data)
                                failure(loginError.error)
                            } catch {
                                print("Login error: \(error)")
                                failure("Login failed")
                            }
                        }
                        return
                    }
                    
                    switch response.result {
                    case .success(let value):
                        // Handle the successful response.
                        if let dict = value as? [String: Any], let token = dict["token"] as? String {
                            success(token)
                        } else {
                            failure("Login failed")
                        }
                    case .failure(let error):
                        // Handle the network or serialization error.
                        print("Login error: \(error)")
                        failure("Login failed")
                    }
                }
        } catch {
            // Handle any exception during the login request.
            print("Login error: \(error)")
            failure("Login failed")
        }
    }
    
    // Function to perform a register request with the given parameters.
    func register(username: String, email: String, blood_type: String, gender: String, password: String, success: @escaping (String, String, Int) -> Void, failure: @escaping (String) -> Void) {
        do {
            try AuthHttpRouter
                .register(AuthModel(email: email, username: username, password: password, blood_type: blood_type, gender: gender))
                .request(usingHttpService: httpService)
                .responseJSON { response in
                    // Handle the response of the register request.
                    guard response.response?.statusCode == 200 else {
                        do {
                            if let data = response.data {
                                // Attempt to decode the error response model.
                                let authError = try JSONDecoder().decode(RegisterErrorModel.self, from: data)
                                
                                // Check if individual error messages exist and invoke the failure closure accordingly.
                                if let emailError = authError.validationErrors.email?.first {
                                    failure(emailError)
                                }
                                if let usernameError = authError.validationErrors.username?.first {
                                    failure(usernameError)
                                }
                                if let passwordError = authError.validationErrors.password?.first {
                                    failure(passwordError)
                                }
                                if let blood_typeError = authError.validationErrors.blood_type?.first {
                                    failure(blood_typeError)
                                }
                                if let genderError = authError.validationErrors.gender?.first {
                                    failure(genderError)
                                }
                            }
                        } catch {
                            print("Registration parsing failed with error - \(error.localizedDescription)")
                            failure("Registration failed")
                        }
                        return
                    }
                    
                    let result = response.result
                    
                    switch result {
                    case .success(let value):
                        if let dict = value as? [String: Any] {
                            // Extract the necessary data from the response dictionary.
                            guard let accessToken = dict["access_token"] as? String,
                                  let tokenType = dict["token_type"] as? String,
                                  let expiresIn = dict["expires_in"] as? Int else {
                                print("Registration token parsing failed")
                                return
                            }
                            success(accessToken, tokenType, expiresIn)  // Invoke the success closure with the extracted data.
                        } else {
                            // Handle the case where the value is not a dictionary
                        }
                    case .failure(let error):
                        print("Registration failed with error: \(error.localizedDescription)")
                        failure("Registration failed with error")
                    }
                }
        } catch {
            print("Registration failed with error = \(error.localizedDescription)")
            failure("Registration failed with error")
        }
    }
}

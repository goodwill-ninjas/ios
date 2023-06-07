//
//  AuthHttpService.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 31/05/2023.
//

import Alamofire

// Define a final class named AuthHttpService that conforms to the HttpService protocol.
final class AuthHttpService: HttpService {
    var sessionManager: Session = Session.default  // The session manager used for sending the request.
    
    // Function to send a request using the session manager and return a validated DataRequest.
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<420)
    }
}

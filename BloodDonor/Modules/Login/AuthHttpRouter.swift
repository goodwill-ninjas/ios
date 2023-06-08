//
//  AuthHttpRouter.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 01/06/2023.
//

import Alamofire
import SwiftUI
// Define an enumeration named AuthHttpRouter.
enum AuthHttpRouter {
    case login(AuthModel)
    case register(AuthModel)
    case validate(token: String)
}

// Extend the AuthHttpRouter enumeration to conform to the HttpRouter protocol.
extension AuthHttpRouter: HttpRouter {
    
    // The base URL string for the request.
    var baseUrlString: String {
        return "https://api.pre.gwn.adamjurkiewicz.com"
    }
    
    // The path component of the URL.
    var path: String {
        switch self {
        case .login:
            return "/api/auth/login"
        case .register:
            return "/api/auth/register"
        case .validate:
            return "/api/users"
        }
    }
    
    // The HTTP method for the request.
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login, .register:
            return .post
        case .validate:
            return .get
        }
    }
    
    // Optional HTTP headers for the request.
    var headers: Alamofire.HTTPHeaders? {
        switch self {
        case .login, .register:
            return [
                "content-type": "application/json; charset=UTF-8"
            ]
        case .validate(let token):
            return [
                "authorization": "\(token)",
                "content-type": "application/json; charset=UTF-8"
            ]
        }
    }
    
    // Optional parameters for the request.
    var parameters: Alamofire.Parameters? {
        return nil
    }
    
    // Function to get the request body as Data.
    func body() throws -> Data? {
        switch self {
            
        case .login(let user), .register(let user):
            return try JSONEncoder().encode(user)
            case .validate:
            return nil
        }
    }
}

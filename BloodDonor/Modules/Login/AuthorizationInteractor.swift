//
//  AuthorizationInteractor.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 31/05/2023.
//

import Foundation

// Define an enumeration named AuthResult with a generic type parameter T.
enum AuthResult<T> {
    case success(result: T)  // Represents a successful result with a value of type T.
    case failure(error: String)  // Represents a failure with an error message.
}

// Define a class named AuthorizationInteractor.
class AuthorizationInteractor {
    
    private let authApi: AuthAPI  // An instance of AuthAPI used for authorization.
    private let database: AuthDB
    static let shared: AuthorizationInteractor = AuthorizationInteractor()  // A shared singleton instance of AuthorizationInteractor.
    
    // Private initializer to enforce the use of the shared singleton instance.
    private init(authApi: AuthAPI = AuthService.shared, database: AuthDB = RealmDatabase.shared) {
        self.authApi = authApi
        self.database = database
    }
}

// Extend the AuthorizationInteractor class.
extension AuthorizationInteractor {
    
    // Function to register a user with the given parameters.
    func register(username: String, email: String, password: String, blood_type: String, gender: String, completion: @escaping (AuthResult<String>) -> Void) -> Void {
        self.authApi.register(
            username: username,
            email: email,
            blood_type: blood_type,
            gender: gender,
            password: password,
            success: { _, _, _ in
                completion(.success(result: "Sign up is successful"))  // Call the completion handler with a successful result.
            }) { (error) in
                completion(.failure(error: error))  // Call the completion handler with a failure and an error message.
            }
    }
    
    // Function to log in a user with the given email and password.
    func login(email: String, password: String, completion: @escaping (AuthResult<String>) -> Void) -> Void {
        self.authApi.login(
            email: email,
            password: password,
            success: { [database] (token) in
                _ = database.saveToken(userToken: UserToken(accessToken: token, email: email, loggedIn: true))
                completion(.success(result: token))
            }) { (error) in
                completion(.failure(error: error))  // Call the completion handler with a failure and an error message.
            }
    }
    
    func validate(usingToken token: String, completion: @escaping (AuthResult<User>) -> Void) -> Void {
        self.authApi.validate(token: token,
                              success: { [database] (user) in
            _ = database.saveUser(usingUser: user)
            completion(.success(result: user))
        }) { (error) in
            completion(.failure(error: error))
        }
    }
}


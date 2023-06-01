//
//  AuthAPI.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 31/05/2023.
//

// Define a protocol named AuthAPI.
protocol AuthAPI {
    
    // Function to perform a registration request.
    func register(
        username: String,
        email: String,
        blood_type: String,
        gender: String,
        password: String,
        success: @escaping (_ token: String, _ tokenType: String, _ expiresIn: Int) -> Void,
        failure: @escaping (_ error: String) -> Void)
    
    // Function to perform a login request.
    func login(
        email: String,
        password: String,
        success: @escaping (_ token: String) -> Void,
        failure: @escaping (_ error: String) -> Void)
    
}


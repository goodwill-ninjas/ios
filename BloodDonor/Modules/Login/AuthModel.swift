//
//  AuthModel.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 01/06/2023.
//

import Foundation


// Define a struct named AuthModel conforming to the Codable protocol.
struct AuthModel: Codable {
    var email: String
    var username: String
    var password: String
    var blood_type: String
    var gender: String
    
    // Initializer to create an instance of AuthModel with required properties.
    init(email: String, username: String = "", password: String, blood_type: String = "", gender: String = "") {
        self.email = email
        self.username = username
        self.password = password
        self.blood_type = blood_type
        self.gender = gender
    }
}

//
//  RegisterErrorModel.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 01/06/2023.
//

import Foundation

// Define a struct named RegisterErrorModel that conforms to the Codable protocol.
struct RegisterErrorModel: Codable {
    let validationErrors: ValidationErrors  // A property that represents validation errors.
    
    // Define an enumeration CodingKeys to customize the coding keys for decoding.
    enum CodingKeys: String, CodingKey {
        case validationErrors = "message"  // Map "message" key in JSON to validationErrors property.
    }
}

// Define a struct named ValidationErrors that conforms to the Codable protocol.
struct ValidationErrors: Codable {
    let email, username, password, blood_type, gender: [String]?  // Optional arrays of error messages for each field.
}

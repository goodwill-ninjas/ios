//
//  ValidationError.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//

import Foundation

struct ValidationError: Codable {
    let message: String
    let statusCode: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case statusCode = "statusCode"
    }
    
}

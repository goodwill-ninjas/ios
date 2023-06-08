//
//  User.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
    case id, email
        case username = "name"
    }
}

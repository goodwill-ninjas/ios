//
//  ValidationResponse.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//

import Foundation

struct ValidationResponse: Codable {
    let user: User
    enum CodingKeys: String, CodingKey {
        case user = "id"
    }
}

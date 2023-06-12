//
//  UserExperience.swift
//  BloodDonor
//
//  Created by Sylwester Kąkol on 12/06/2023.
//

import Foundation

struct UserExperience : Codable {
    let level: Int
    let current_experience: Int
    let min_experience: Int
    let max_experience: Int
}

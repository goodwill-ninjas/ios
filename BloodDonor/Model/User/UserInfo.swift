//
//  UserInfo.swift
//  BloodDonor
//
//  Created by Sylwester Kąkol on 12/06/2023.
//

import Foundation

struct UserInfo : Codable {
    let id: Int
    let email: String
    let username: String
    let blood_type: String
    let gender: String
    let avatar_id: Int?
    let has_verified_email: Bool
    let settings: UserSettings
    let exp_details: UserExperience
    let can_donate_after: String
    let created_at: String
}

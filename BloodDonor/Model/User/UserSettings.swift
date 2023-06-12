//
//  UserSettings.swift
//  BloodDonor
//
//  Created by Sylwester Kąkol on 12/06/2023.
//

import Foundation

struct UserSettings : Codable {
    let id: Int
    let theme: String
    let font_size: String
    let event_notifications: Bool
    let reminder_notifications: Bool
    let created_at: String
    let updated_at: String
}

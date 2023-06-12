//
//  Donation.swift
//  BloodDonor
//
//  Created by Sylwester Kąkol on 12/06/2023.
//

import Foundation

struct Donation : Codable {
    let id: Int
    let user_id: Int
    let disqualified: Bool
    let disqualification_days: Int?
    let companion_user_id: Int?
    let donated_type: String
    let amount: Int
    let blood_pressure: String?
    let hemoglobin: Int?
    let details: String?
    let arm: String?
    let donated_at: String
    let created_at: String
    let deleted_at: String?
}

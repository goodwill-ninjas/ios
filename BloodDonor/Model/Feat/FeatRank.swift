//
//  FeatRank.swift
//  BloodDonor
//
//  Created by Sylwester Kąkol on 12/06/2023.
//

import Foundation

struct FeatRank : Codable {
    let id: Int
    let requirement: Int
    let experience_award: Int
    let title_award: String?
    let avatar_award: Int?
    let medal_award: Int?
    let created_at: String
}

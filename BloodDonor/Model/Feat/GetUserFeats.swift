//
//  GetUserFeats.swift
//  BloodDonor
//
//  Created by Sylwester Kąkol on 12/06/2023.
//

import Foundation

struct GetUserFeat: Codable {
    let userId: Int
    let featId: Int
    let featName: String
    let featDescription: String
    let achievedRanks: [FeatRank]?
    let nextRanks: [FeatRank]?
}



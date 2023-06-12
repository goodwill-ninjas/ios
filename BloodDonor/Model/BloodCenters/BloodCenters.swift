//
//  BloodCenters.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import Foundation

struct BloodCenters: Codable {
    var id: Int
    var name: String
    var street_name: String
    var street_number: String
    var postal_code: String
    var city: String
    var voivodeship: String
    var geo_coordinates: String
    var phone_number: String
    var open_from: String?
    var open_to: String?
    var blood_center_details: [BloodCenterBankDetails]?

}

struct BloodCenterBankDetails: Codable {
    var id: Int
    var blood_type: String
    var capacity: String
    var source_datetime: String
}

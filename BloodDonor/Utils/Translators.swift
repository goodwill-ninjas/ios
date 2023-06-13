//
//  Translators.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 13/06/2023.
//

import Foundation

enum BloodTypeTranslation: String {
    case whole = "Krew Pełna"
    case plasma = "Osocze"
    case platelet = "Płytki Krwi"
    case power = "Krwinki Czerwone"
    
    var translatedValue: String {
        return rawValue
    }
    
    static func translateBloodType(type: String) -> String {
        if let bloodType = BloodTypeTranslation(rawValue: type) {
            return bloodType.translatedValue
        } else {
            return "Krew"
        }
    }
}

//
//  BloodTypeModal.swift
//  BloodDonor
//
//  Created by Adam Jurkiewicz on 17/05/2023.
//

import Foundation
import SwiftUI

struct BloodTypeModal: View {
    var bloodTypeImage: String

    var bloodTypeName: String
    var lastDonationDate: String // TODO: should be of 'Date' type
    var daysUntilNextDonation: String // TODO: should be of 'Date' type
    
    var body: some View {
        var image: Image {
            Image(bloodTypeImage)
        }
    }
}

extension BloodTypeModal {
    static let bloodTypes: [BloodTypeModal] =
    [
        BloodTypeModal(
            bloodTypeImage: "blood_full",
            bloodTypeName: "Krew pełna",
            lastDonationDate: "2023-05-01",
            daysUntilNextDonation: "12"
        ),
        BloodTypeModal(
            bloodTypeImage: "blood_red_cells",
            bloodTypeName: "Krwinki czerwone",
            lastDonationDate: "2023-02-24",
            daysUntilNextDonation: "14"
        )
    ]
}

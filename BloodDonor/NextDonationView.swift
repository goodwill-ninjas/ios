//
//  NextDonationView.swift
//  BloodDonor
//
//  Created by Adam Jurkiewicz on 14/05/2023.
//

import SwiftUI

struct BloodTypeModal {
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var name: String
    var lastDonationDate: Date
    var daysUntilNextDonation: String
    
}

struct NextDonationView: View {
    var body: some View {
        var bloodTypeModal: BloodTypeModal
        
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
            bloodTypeModal.image
        }
    }
}

struct NextDonationView_Previews: PreviewProvider {
    static var previews: some View {
        NextDonationView()
    }
}


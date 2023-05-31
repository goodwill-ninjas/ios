//
//  NextDonationView.swift
//  BloodDonor
//
//  Created by Adam Jurkiewicz on 14/05/2023.
//

import SwiftUI

struct NextDonationView: View {
    let modal: BloodTypeModal
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .foregroundColor(Color(red: 245/255, green: 222/255, blue: 179/255))
                HStack {
                    Image(modal.bloodTypeImage)
                        .resizable()
                        .frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(modal.bloodTypeName)
                            .font(.title)
                        Text(modal.lastDonationDate)
                            .font(.subheadline)
                        Spacer()
                        Text("Możesz oddać " + modal.bloodTypeName)
                        Text("za: " + modal.daysUntilNextDonation + " dni")
                        Spacer()
                    }
                }
            }
            .frame(width: 400, height: 140)
        }
    }
}

struct NextDonationView_Previews: PreviewProvider {
    static var modal = BloodTypeModal.bloodTypes[0]
    static var previews: some View {
        NextDonationView(modal: modal)
            .previewLayout(.fixed(width: 400, height: 140))
    }
}


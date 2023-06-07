//
//  BloodCenterView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 30/05/2023.
//

import SwiftUI

struct BloodCenterView: View {
//    let bloodCenterDataService = BloodCenterDataService()
//
//    init() {
//        bloodCenterDataService.fetchBloodCenterData()
//    }
    
    let center: [BloodCenters]
    let bankDetails: [BloodCenterBankDetails]
    
    var body: some View {
        NavigationView {
            VStack {
                List (center, id: \.id) { center in
                    NavigationLink {
                        BloodCenterDetail(center: center, bankDetails: bankDetails)
                    } label: {
                        BloodCenterRow(center: center)
                    }
                    
                }
            }
            .navigationTitle("Placówki")
        }
    }
}

struct BloodCenterView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCenter = BloodCenters.sampleCenters
        let sampleBankDetails = BloodCenterBankDetails.sampleBankDetails
        BloodCenterView(center: sampleCenter, bankDetails: sampleBankDetails)
    }
}

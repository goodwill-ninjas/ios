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
    
    var body: some View {
        NavigationView {
            VStack {
                List (center, id: \.id) { center in
                    NavigationLink {
                        BloodCenterDetail(center: center)
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
        BloodCenterView(center: sampleCenter)
    }
}

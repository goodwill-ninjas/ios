//
//  BloodCenterRow.swift
//  BloodDonor
//
//  Created by Adam Jurkiewicz on 31/05/2023.
//

import SwiftUI

struct BloodCenterRow: View {
    var center: BloodCenters
    
    
//    let bloodCenterDataService = BloodCenterDataService()
//    init() {
//        // center = bloodCenterDataService.fetchBloodCenterData()
//    }
    
    var body: some View {
        VStack {
            Text("🏥   " + center.name)
                .bold()
        }
    }
}

struct BloodCenterRow_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let center = BloodCenters.sampleCenters
        BloodCenterRow(center: center[0])
    }
}

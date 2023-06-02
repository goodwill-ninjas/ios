//
//  DonationView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 30/05/2023.
//

import SwiftUI

struct DonationListView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("👀 Brak donacji")
                    .font(.largeTitle.bold())
                Text("Trochę tu pusto, pora dodać jakąs donacje!")
                    .font(.callout)
            }
            .navigationTitle("Lista donacji")
        }
    }
}

struct DonationListView_Previews: PreviewProvider {
    static var previews: some View {
        DonationListView()
    }
}

//
//  DonationListView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 30/05/2023.
//

import SwiftUI

struct DonationListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
            }
            .navigationTitle("Donations")
        }
    }
}

struct DonationListView_Previews: PreviewProvider {
    static var previews: some View {
        DonationListView()
    }
}

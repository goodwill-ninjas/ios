//
//  BloodCenterView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 30/05/2023.
//

import SwiftUI

struct BloodCenterView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
            }
            .navigationTitle("Maps")
        }
    }
}

struct BloodCenterView_Previews: PreviewProvider {
    static var previews: some View {
        BloodCenterView()
    }
}

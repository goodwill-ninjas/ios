//
//  ContentView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 10/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mainVm = MainViewModel()
    @StateObject var bloodCentersVm = BloodCentersViewModel()
    @StateObject var donationVM = DonationViewModel()
    
    var body: some View {
        NavigationView {
            if mainVm.showAuthContainer {
                LoginView()
                    .environmentObject(bloodCentersVm)
                    .environmentObject(donationVM)
            } else {
                MainView()
                    .environmentObject(bloodCentersVm)
                    .environmentObject(donationVM)
            }
        }
        .background(Color.white.ignoresSafeArea())
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(mainVm)
        .environmentObject(bloodCentersVm)
        .environmentObject(donationVM)
        .navigationBarTitle("", displayMode: .inline)
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

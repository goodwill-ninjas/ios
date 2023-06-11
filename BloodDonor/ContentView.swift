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
    
    var body: some View {
        NavigationView {
            if mainVm.showAuthContainer {
                LoginView()
                    .environmentObject(bloodCentersVm)
            } else {
                MainView()
                    .environmentObject(bloodCentersVm)
            }
        }
        .background(Color.white.ignoresSafeArea())
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(mainVm)
        .environmentObject(bloodCentersVm)
        .navigationBarTitle("", displayMode: .inline)
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

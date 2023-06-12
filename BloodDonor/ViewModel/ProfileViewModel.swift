//
//  ProfileViewModel.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import Foundation
import SwiftUI
import JWTDecode

class ProfileViewModel: ObservableObject {
    
    @Published var showAuthContainer = true
    @Published var loginPending = false
    @Published var alert: IdentifiableAlert?
    
    func logout() {
        UserDefaultsWorker.shared.dropTokens()
        Requester.shared.dropTokens()
        withAnimation {
            showAuthContainer = true
        }
    }
    
    func getUserProfile() {
        
    }
}

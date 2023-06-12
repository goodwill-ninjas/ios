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
    
    func addDonation(email: String, password: String) {
        withAnimation {
            loginPending = true
        }
        print("add donation called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.login(authBody: LoginBody(email: email, password: password)) { [self] result in
                print("login response: \(result)")
                withAnimation {
                    loginPending = false
                }
                switch result {
                case .success(let user):
                    do {
                        let jwt = try decode(jwt: user.token)
                        if let userId = decodeJWTforUserID(jwtToken: user.token) {
                            if let displayName = extractDisplayNameFromJWT(jwtToken: user.token) {
                                UserDefaultsWorker.shared.saveAuthTokens(tokens: user.getTokensInfo(), userId: userId, displayName: displayName)
                                //                                if let userId = UserDefaultsWorker.shared.getUserId() {
                                //                                    print("User ID:", userId)
                                //                                }
                            }
                        }
                    } catch let error {
                        // Handle the error thrown by the decode function
                        print("JWT decoding error: \(error)")
                        // Show an error message or handle the error appropriately
                    }
                    withAnimation {
                        self.showAuthContainer = false
                    }
                case .serverError(let err):
                    alert = IdentifiableAlert.buildForError(id: "login_server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    alert = IdentifiableAlert.networkError()
                case .authError(let err):
                    alert = IdentifiableAlert.buildForError(id: "login_err", message: Errors.messageFor(err: err.message))
                }
            }
        }
    }
}

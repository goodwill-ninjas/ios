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
    
    @Published var userInfo: UserInfo? = nil
    @Published var showAuthContainer = true
    @Published var loadingState: LoadingState = .notStarted
    @Published var registerPending = false
    @Published var alert: IdentifiableAlert?
    
    func logout() {
        UserDefaultsWorker.shared.dropTokens()
        Requester.shared.dropTokens()
        withAnimation {
            showAuthContainer = true
        }
    }
    
    func getUserInfo () {
        withAnimation {
            loadingState = .loading
        }
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.getUserInfo() { [self] result in
                withAnimation {
                    registerPending = false
                }
                
                switch result {
                case .success(let resultUserInfo):
                    withAnimation {
                        userInfo = resultUserInfo
                        loadingState = .finished
                    }
                case .serverError(let err):
                    withAnimation {
                        loadingState = .error
                    }
                    alert = IdentifiableAlert.buildForError(id: "user_info__server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    withAnimation {
                        loadingState = .error
                    }
                    alert = IdentifiableAlert.networkError()
                case .authError(_):
                    withAnimation {
                        self.showAuthContainer = true
                    }
                }
            }
        }
    }
}

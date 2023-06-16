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
    @Published var userFeats: [UserFeats] = []
    @Published var showAuthContainer = true
    @Published var userInfoLoadingState: LoadingState = .notStarted
    @Published var userFeatsLoadingState: LoadingState = .notStarted
    @Published var registerPending = false
    @Published var alert: IdentifiableAlert?
    
    init () {
        getUserInfo()
    }
    
    func logout() {
        UserDefaultsWorker.shared.dropTokens()
        Requester.shared.dropTokens()
        withAnimation {
            showAuthContainer = true
        }
    }
    
    func forceInit () {
        getUserInfo()
    }
    
    var formattedCanDonateAfter: String {
        guard let userInfo = userInfo else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Modify the date format as needed
        if let date = dateFormatter.date(from: userInfo.can_donate_after) {
            dateFormatter.dateStyle = .long
            return "\(dateFormatter.string(from: date))"
        } else {
            return ""
        }
    }
    
    func getUserInfo () {
        withAnimation {
            userInfoLoadingState = .loading
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
                        userInfoLoadingState = .finished
                    }
                case .serverError(let err):
                    withAnimation {
                        userInfoLoadingState = .error
                    }
                    alert = IdentifiableAlert.buildForError(id: "user_info_server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    withAnimation {
                        userInfoLoadingState = .error
                    }
                    alert = IdentifiableAlert.networkError()
                case .authError(_):
                    withAnimation {
                        self.showAuthContainer = true
                    }
                }
            }
            
            Requester.shared.getUserFeats() { [self] result in
                withAnimation {
                    registerPending = false
                }
                switch result {
                case .success(let resultUserFeats):
                    withAnimation {
                        userFeats = resultUserFeats
                        userFeatsLoadingState = .finished
                    }
                case .serverError(let err):
                    withAnimation {
                        userFeatsLoadingState = .error
                    }
                    alert = IdentifiableAlert.buildForError(id: "user_feats__server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    withAnimation {
                        userFeatsLoadingState = .error
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
    
//    func getUserFeats () {
//        withAnimation {
//            loadingState = .loading
//        }
//        DispatchQueue.global(qos: .userInitiated).async {
//            Requester.shared.getUserFeats() { [self] result in
//                withAnimation {
//                    registerPending = false
//                }
//                switch result {
//                case .success(let resultUserFeats):
//                    withAnimation {
//                        userFeats = resultUserFeats
//                        loadingState = .finished
//                    }
//                case .serverError(let err):
//                    withAnimation {
//                        loadingState = .error
//                    }
//                    alert = IdentifiableAlert.buildForError(id: "user_feats__server_err", message: Errors.messageFor(err: err.message))
//                case .networkError(_):
//                    withAnimation {
//                        loadingState = .error
//                    }
//                    alert = IdentifiableAlert.networkError()
//                case .authError(_):
//                    withAnimation {
//                        self.showAuthContainer = true
//                    }
//                }
//            }
//        }
//    }
}

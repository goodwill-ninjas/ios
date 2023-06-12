//
//  DonationListViewModel.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import Foundation
import SwiftUI

class DonationListViewModel: ObservableObject {
    @Published var userDonations: [Donation] = []
    @Published var loadingState: LoadingState = .notStarted
    @Published var showAuthContainer: Bool = true
    @Published var registerPending = false
    @Published var alert: IdentifiableAlert?
    
    func getUserDonations() {
        withAnimation {
            loadingState = .loading
        }
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.getUserDonations() { [self] result in
                withAnimation {
                    registerPending = false
                }
                switch result {
                case .success(let userDonation):
                    withAnimation {
                        userDonations = userDonation
                        loadingState = .finished
                    }
                case .serverError(let err):
                    withAnimation {
                        loadingState = .error
                    }
                    alert = IdentifiableAlert.buildForError(id: "user_donations__server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    withAnimation {
                        loadingState = .error
                    }
                    alert = IdentifiableAlert.networkError()
                case .authError(_):
                    withAnimation{
                        self.showAuthContainer = true
                    }
                }
            }
        }
    }
}

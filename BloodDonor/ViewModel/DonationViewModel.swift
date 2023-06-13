import Foundation
import SwiftUI
import JWTDecode

class DonationViewModel: ObservableObject {
    @Published var showAuthContainer = true
    @Published var addDonationPending = false
    @Published var alert: IdentifiableAlert?
    
    func addDonation(user_id: Int, disqualified: Bool?, companion_user_id: Int?, donated_type: String?, amount: Int?, blood_pressure: String?, hemoglobin: String?, arm: String?, details: String?, donated_at: String?, disqualification_days: Int?) {
        guard let user_id = UserDefaultsWorker.shared.getUserId() else {
            print("User ID not available")
            return
        }
        
        withAnimation {
            addDonationPending = true
        }
        
        print("add donation called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.addDonation(donationBody: AddDonation(user_id: user_id, disqualified: disqualified, companion_user_id: companion_user_id, donated_type: donated_type, amount: amount, blood_pressure: blood_pressure, hemoglobin: hemoglobin, arm: arm, details: details, donated_at: donated_at, disqualification_days: disqualification_days)) { [self] result in
                print("donation response: \(result)")
                withAnimation {
                    addDonationPending = false
                }
                
                switch result {
                case .success(_):
                    // Handle the successful donation response
                    withAnimation {
                        self.showAuthContainer = false
                    }
                case .serverError(_):
                    withAnimation {
                        self.showAuthContainer = false
                    }
                case .networkError(_):
                    withAnimation {
                        self.showAuthContainer = false
                    }
                case .authError(_):
                    withAnimation {
                        self.showAuthContainer = false
                    }

                }
            }
        }
    }
}

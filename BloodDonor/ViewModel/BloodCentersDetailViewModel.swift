import Foundation
import SwiftUI

class BloodCentersDetailViewModel: ObservableObject {
    @Published var bloodCenters: [BloodCenters] = []
    @Published var bloodCenterBankDetails: BloodCenters? = nil
    @Published var checkProgress: LoadingState = .notStarted
    @Published var showAuthContainer = true
    @Published var loginPending = false
    @Published var registerPending = false
    @Published var alert: IdentifiableAlert?
    
//    func firstIndexForCity(city: String) -> Int {
//            guard let index = bloodCenters.firstIndex(where: { $0.city == city }) else {
//                // Handle the case where the city is not found in the bloodCenters array
//                return 0 // Return a default index or handle the error appropriately
//            }
//            return index
//        }
    
    func getBloodCenterById(city: String) {
        withAnimation {
            checkProgress = .loading
        }
        print("getBloodCenterById called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.getBloodCenterById(city: city) { [self] result in
                print("getBloodCenterById response: \(result)")
                withAnimation {
                    registerPending = false
                }
//                TODO: on success - should be accessible from the ViewModel
                switch result {
                case .success(let bloodCenterBankDetail):
                    print("was successful!")
                    withAnimation {
                        bloodCenterBankDetails = bloodCenterBankDetail
                        checkProgress = .finished
                    }
                case .serverError(_):
                    withAnimation {
                        checkProgress = .error
                    }
                case .authError(_):
                    withAnimation {
                        self.showAuthContainer = true
                    }
                case .networkError(_):
                    withAnimation {
                        checkProgress = .error
                    }
                }
            }
        }
    }
}

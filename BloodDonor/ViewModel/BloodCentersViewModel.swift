import Foundation
import SwiftUI

class BloodCentersViewModel: ObservableObject {
    @Published var bloodCenters: [BloodCenters] = []
    @Published var bloodCenterBankDetails: [BloodCenterBankDetails] = []
    @Published var checkProgress: LoadingState = .notStarted
    @Published var showAuthContainer = true
    @Published var loginPending = false
    @Published var registerPending = false
    @Published var alert: IdentifiableAlert?
    
    func getBloodCenters() {
        withAnimation {
            checkProgress = .loading
        }
        print("get bloodCenters called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.getBloodCenter() { [self] result in
                print("get bloodCenters response: \(result)")
                withAnimation {
                    registerPending = false
                }
                switch result {
                case .success(let bloodCenter):
                    withAnimation {
                        bloodCenters = bloodCenter
                        checkProgress = .finished
                    }
                case .serverError(let err):
                    withAnimation {
                        checkProgress = .error
                    }
                    alert = IdentifiableAlert.buildForError(id: "blood_centers__server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    withAnimation {
                        checkProgress = .error
                    }
                    alert = IdentifiableAlert.networkError()
                case .authError(let err):
                    withAnimation {
                        self.showAuthContainer = true
                    }
                }
            }
        }
    }
    
    // Moved to BloodCentersDetailViewModel
//    func firstIndexForCity(city: String) -> Int {
//            guard let index = bloodCenters.firstIndex(where: { $0.city == city }) else {
//                // Handle the case where the city is not found in the bloodCenters array
//                return 0 // Return a default index or handle the error appropriately
//            }
//            return index
//        }
    
//    func getBloodCenterById(city: String) {
//        withAnimation {
//            checkProgress = .loading
//        }
//        print("getBloodCenterById called")
//        DispatchQueue.global(qos: .userInitiated).async {
//            Requester.shared.getBloodCenterById(city: city) { [self] result in
//                print("getBloodCenterById response: \(result)")
//                withAnimation {
//                    registerPending = false
//                }
////                TODO: on success - should be accessible from the ViewModel
//                switch result {
//                case .success(let bloodCenter):
//                    print("was successful!")
//                    withAnimation {
//                        bloodCenterBankDetails = bloodCenterBankDetails
//                        checkProgress = .finished
//                    }
//                case .serverError(_):
//                    withAnimation {
//                        checkProgress = .error
//                    }
//                case .authError(_):
//                    withAnimation {
//                        self.showAuthContainer = true
//                    }
//                case .networkError(_):
//                    withAnimation {
//                        checkProgress = .error
//                    }
//                }
//            }
//        }
//    }
}

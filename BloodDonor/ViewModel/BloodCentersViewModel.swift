import Foundation
import SwiftUI

class BloodCentersViewModel: ObservableObject {
    @Published var bloodCenters: [BloodCenters] = []
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
}

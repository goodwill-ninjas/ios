import Foundation
import SwiftUI
//This means it can be used as a view model in SwiftUI and allows for observing changes to its published properties

class MainViewModel: ObservableObject {
    
    @Published var showAuthContainer = true
    @Published var loginPending = false
    @Published var registerPending = false
    @Published var alert: IdentifiableAlert?
    
    func logout() {
        UserDefaultsWorker.shared.dropTokens()
        Requester.shared.dropTokens()
        withAnimation {
            showAuthContainer = true
        }
    }
    
    func getUserID(from jwtToken: String) throws -> Int {
        guard let payload = try decode(jwtToken: jwtToken) as? [String: Any],
              let user = payload["user"] as? [String: Any],
              let userID = user["userID"] as? Int else {
            throw DecodeErrors.other
        }
        return userID
    }
    
    func login(email: String, password: String) {
        withAnimation {
            loginPending = true
        }
        print("login called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.login(authBody: LoginBody(email: email, password: password)) { [self] result in
                print("login response: \(result)")
                withAnimation {
                    loginPending = false
                }
                switch result {
                case .success(let user):
//                    let token = user.token
//                    print("Token: \(token)")
//                    do {
//                        let userID = try getUserID(from: token)
//                        print("User ID: \(userID)")
//                    } catch {
//                        print("Failed to extract user ID: \(error)")
//                    }
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
    
    func register(email: String, username: String, password: String, blood_type: String, gender: String, avatar_id: Int) {
        withAnimation {
            registerPending = true
        }
        print("register called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.register(authBody: RegisterBody(email: email, username: username, password: password, blood_type: blood_type, gender: gender, avatar_id: nil)) { [self] result in
                print("register response: \(result)")
                withAnimation {
                    registerPending = false
                }
                switch result {
                case .success(_):
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

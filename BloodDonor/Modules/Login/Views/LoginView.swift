import SwiftUI

import SwiftUI
import Alamofire

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                login()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
    }
    
    private func login() {
        // Create an instance of AuthorizationInteractor.
        let interactor = AuthorizationInteractor.shared
        
        // Call the login method with the entered email and password.
        interactor.login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                // Authentication successful, handle the JWT token.
                print("Logged in with token: \(token)")
                // Proceed to the next screen or perform necessary actions.
                
            case .failure(let error):
                // Authentication failed, display an error message.
                print("Login error: \(error)")
                // Display an error message to the user.
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


/*
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: login) {
                Text("Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func login() {
        // Convert the first character of the email to lowercase
        let lowercasedEmail = email.prefix(1).lowercased() + email.dropFirst(1)
        
        let parameters: [String: Any] = [
            "email": lowercasedEmail,
            "password": password
        ]
        
        AF.request("https://api.pre.gwn.adamjurkiewicz.com/api/auth/login",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let token = json["token"] as? String {
                        // Store the token or perform any necessary actions
                        print("Login success! Token: \(token)")
                    }
                case .failure(let error):
                    print("Login failed: \(error.localizedDescription)")
                }
            }
    }

}
*/

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}


//struct LoginView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var wrongUsername = 0
//    @State private var wrongPassword = 0
//
//    @State private var showingLoginScreen = false
//    @State private var showingResetPasswordScreen = false
//    @State private var showingRegisterScreen = false
//
//    var body: some View {
//
//
//        NavigationView{
//            ZStack{
//
//                Color.red
//                    .ignoresSafeArea()
//                //outter layer
//                Circle()
//                    .scale(1.7)
//                    .foregroundColor(.white.opacity(0.15))
//                //inner layer
//                Circle()
//                    .scale(1.35)
//                    .foregroundColor(.white)
//
//                VStack{
//                    Text("Login")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
//                    TextField("Nazwa użytkownika lub e-mail", text: $username)
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background(Color.blue.opacity(0.05))
//                        .cornerRadius(10)
//                        .border(.red, width: CGFloat(wrongUsername))
//                    SecureField("Podaj hasło", text: $password)
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background(Color.blue.opacity(0.05))
//                        .cornerRadius(10)
//                        .border(.red, width: CGFloat(wrongPassword))
//                    Button("Zaloguj się"){
//                        authenticateUser(username: username, password: password)
//
//                    }
//                    .foregroundColor(.white)
//                    .frame(width: 300, height: 50)
//                    .background(Color.red)
//                    .cornerRadius(10)
//                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
//                        EmptyView()
//                    }
//                    HStack {
//                        Button("Zapomniałeś hasła?") {
//                            showingResetPasswordScreen = true
//                        }
//                        .foregroundColor(.black)
//                        .padding(.top, 10)
//
//                        NavigationLink(destination: RegisterView(), isActive: $showingRegisterScreen) {
//                            Text("Nie masz konta?")
//                        }
//                        .foregroundColor(.black)
//                        .padding(.top, 10)
//                    }
//                }
//
//            }
//            .navigationBarHidden(true)
//        }
//        .sheet(isPresented: $showingResetPasswordScreen) {
//            ResetPasswordView()
//        }
//
//    }
//
//    func authenticateUser(username: String, password: String){
//
//        if username.lowercased() == "test" {
//            wrongUsername = 0
//            if password.lowercased() == "123"{
//                wrongPassword = 0
//                showingLoginScreen = true
//            }
//            else{
//                wrongPassword = 2
//            }
//        }
//        else{
//            wrongUsername = 2
//        }
//
//    }
//
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

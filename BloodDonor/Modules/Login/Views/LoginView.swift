import SwiftUI
import Alamofire

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingResetPasswordScreen: Bool = false
    @State private var showingRegisterScreen: Bool = false
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                // Outer layer
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                // Inner layer
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Nazwa użytkownika lub e-mail", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                    SecureField("Podaj hasło", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(10)
                    Button("Zaloguj się") {
                        login()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    HStack {
                        Button("Zapomniałeś hasła?") {
                            showingResetPasswordScreen = true
                        }
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        
                        NavigationLink(destination: RegisterView(), isActive: $showingRegisterScreen) {
                            Text("Nie masz konta?")
                        }
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showingResetPasswordScreen) {
            ResetPasswordView()
        }
        .onAppear {
            if isLoggedIn {
                navigateToHomeView()
            }
        }
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
                isLoggedIn = true
                navigateToHomeView()
                
            case .failure(let error):
                // Authentication failed, display an error message.
                print("Login error: \(error)")
                // Display an error message to the user.
            }
        }
    }
    
    private func navigateToHomeView() {
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: ContentView())
                window.makeKeyAndVisible()
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

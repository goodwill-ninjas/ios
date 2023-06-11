import SwiftUI

struct LoginView: View {
    @EnvironmentObject var mainVm: MainViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("E-mail", text: $email)
                        .padding()
                        .disabled(mainVm.loginPending)
                        .frame(width: 300, height: 50)
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                    SecureField("Podaj hasło", text: $password)
                        .padding()
                        .disabled(mainVm.loginPending)
                        .frame(width: 300, height: 50)
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(10)
                    
                    if mainVm.loginPending {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            .scaleEffect(1.2)
                            .padding(.top, 26)
                    } else {
                        Button {
                            hideKeyboard()
                            if email.isEmpty {
                                mainVm.alert = IdentifiableAlert.build(id: "empty_login",
                                                                       title: "Invalid login",
                                                                       message: "Login can't be empty")
                                return
                            }
                            if password.count < 1 {
                                mainVm.alert = IdentifiableAlert.build(id: "empty_password",
                                                                       title: "Invalid password",
                                                                       message: "Password lenght must be 2 or more characters")
                                return
                            }
                            mainVm.login(email: email, password: password)
                        } label: {
                            Text("Zaloguj się")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                        }
                        .disabled(mainVm.loginPending)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("Nie masz konta? Zarejestruj się!")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                        }
                        .padding(.top, 12)
                    }
                }
            }
        }
        .alert(item: $mainVm.alert) { alert in
            alert.alert()
        }
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var showingLoginScreen = false
    @State private var showingResetPasswordScreen = false
    @State private var showingRegisterScreen = false
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                
                Color.red
                    .ignoresSafeArea()
                //outter layer
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                //inner layer
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Nazwa użytkownika lub e-mail", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Podaj hasło", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.blue.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Zaloguj się"){
                        authenticateUser(username: username, password: password)
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
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
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingResetPasswordScreen) {
            ResetPasswordView()
        }
        
    }
    
    func authenticateUser(username: String, password: String){
        
        if username.lowercased() == "test" {
            wrongUsername = 0
            if password.lowercased() == "123"{
                wrongPassword = 0
                showingLoginScreen = true
            }
            else{
                wrongPassword = 2
            }
        }
        else{
            wrongUsername = 2
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

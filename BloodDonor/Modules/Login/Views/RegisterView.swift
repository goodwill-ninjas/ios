import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var blood_type = ""
    @State private var gender = "Mężczyzna"
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            Text("Rejestracja")
                .font(.largeTitle)
                .bold()
                .padding()
            TextField("Adres e-mail", text: $email)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
                .autocapitalization(.none)
            TextField("Nazwa użytkownika", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
                .autocapitalization(.none)
            SecureField("Hasło", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            TextField("Grupa krwi", text: $blood_type)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            Picker("Płeć", selection: $gender) {
                Text("Mężczyzna").tag("Mężczyzna")
                Text("Kobieta").tag("Kobieta")
            }
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.blue.opacity(0.05))
            .cornerRadius(10)
            .pickerStyle(.segmented)
            Button("Zarejestruj się") {
                // Logika rejestracji konta
                registerUser()
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.red)
            .cornerRadius(10)
        }
        .padding()
        if showError {
            Text(errorMessage)
                .foregroundColor(.red)
                .padding(.top, 20)
        }
    }
    
    
    private func registerUser() {
           AuthService.shared.register(
               username: username,
               email: email,
               blood_type: blood_type,
               gender: gender,
               password: password
           ) { accessToken, tokenType, expiresIn in
               print("Registration success")
               // Handle successful registration, e.g., save token or navigate to the next screen
           } failure: { error in
               showError = true
               errorMessage = error
           }
       }
}
    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }

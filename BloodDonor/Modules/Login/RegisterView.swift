import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var bloodType = ""
    @State private var gender = ""
    @State private var showingAlert = false
    
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
            TextField("Nazwa użytkownika", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            SecureField("Hasło", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            TextField("Grupa krwi", text: $bloodType)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            TextField("Płeć", text: $gender)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
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
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Sukces"), message: Text("Konto zostało pomyślnie zarejestrowane"), dismissButton: .default(Text("OK")))
        }
    }
    
    func registerUser() {
        // Logika rejestracji konta
        // Tutaj można wykorzystać przekazane dane z API
        // W tym przykładzie wyświetlamy jedynie alert potwierdzający rejestrację
        showingAlert = true
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

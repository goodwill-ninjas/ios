import SwiftUI

struct ResetPasswordView: View {
    @State private var email = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Resetuj hasło")
                .font(.largeTitle)
                .bold()
                .padding()
            TextField("Adres e-mail", text: $email)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            Button("Wyślij reset hasła") {
                // Logika wysyłania resetu hasła
                showingAlert = true
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.red)
            .cornerRadius(10)
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Reset Hasła"), message: Text("Link do resetu hasła został wysłany na adres: \(email)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}

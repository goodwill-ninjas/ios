import SwiftUI

struct LoginSwiftUIView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .padding()
            
            TextField("Email or username", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                // Perform login action here
            }) {
                Text("Log in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.red)
                    .cornerRadius(15.0)
            }.padding(.top)
        }
    }
}

struct LoginSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSwiftUIView()
    }
}

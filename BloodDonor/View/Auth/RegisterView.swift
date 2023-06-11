import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var mainVm: MainViewModel
    
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var blood_type = ""
    @State private var gender = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            Text("Rejestracja")
                .font(.largeTitle)
                .bold()
                .padding()
            TextField("Adres e-mail", text: $email.animation())
                .padding()
                .disabled(mainVm.registerPending)
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
                .autocapitalization(.none)
            TextField("Nazwa użytkownika", text: $username)
                .padding()
                .disabled(mainVm.registerPending)
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
                .autocapitalization(.none)
            SecureField("Hasło", text: $password)
                .padding()
                .disabled(mainVm.registerPending)
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            TextField("Grupa krwi", text: $blood_type)
                .padding()
                .disabled(mainVm.registerPending)
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            TextField("Płeć", text: $gender)
                .padding()
                .disabled(mainVm.registerPending)
                .frame(width: 300, height: 50)
                .background(Color.blue.opacity(0.05))
                .cornerRadius(10)
            
            if mainVm.registerPending {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(1.2)
                    .padding(.top, 26)
            } else {
                Button {
                    hideKeyboard()
                    if email.isEmpty {
                        mainVm.alert = IdentifiableAlert.build(id: "empty_email",
                                                               title: "Invalid email",
                                                               message: "Email can't be empty")
                        return
                    }
                    if username.isEmpty {
                        mainVm.alert = IdentifiableAlert.build(id: "empty_username",
                                                               title: "Invalid username",
                                                               message: "Username can't be empty")
                        return
                    }
                    if password.count < 1 {
                        mainVm.alert = IdentifiableAlert.build(id: "empty_password",
                                                               title: "Invalid password",
                                                               message: "Password lenght must be 2 or more characters")
                        return
                    }
                    if blood_type.isEmpty {
                        mainVm.alert = IdentifiableAlert.build(id: "empty_blood_type",
                                                               title: "Invalid blood_type",
                                                               message: "Blood type can't be empty")
                        return
                    }
                    if gender.isEmpty {
                        mainVm.alert = IdentifiableAlert.build(id: "empty_gender",
                                                               title: "Invalid gender",
                                                               message: "Gender type can't be empty")
                        return
                    }
                    mainVm.register(email: email, username: username, password: password, blood_type: blood_type, gender: gender, avatar_id: 0)
                } label: {
                    Text("Zarejestruj się")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                }
                .disabled(mainVm.registerPending)
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.red)
                .cornerRadius(10)
                
                .navigationBarTitle("Rejestracja", displayMode: .inline)
                .background(Color.white.ignoresSafeArea())
                .alert(item: $mainVm.alert) { alert in
                    alert.alert()
                }
            }
        }
        
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

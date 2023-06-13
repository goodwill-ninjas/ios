import SwiftUI

struct ProfileView: View {
    @State var index = 0
    @EnvironmentObject var userProfile: ProfileViewModel
    
    let lightGray = Color(red: 0.83, green: 0.83, blue: 0.83, opacity: 1.0)
    
    var body: some View {
        NavigationView {
            VStack {
                switch userProfile.loadingState {
                case .finished:
                    VStack {
                        // User Avatar
                        HStack {
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(Color.red)
                                    .frame(width: 80, height: 3)
                                    .zIndex(1)
                                
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(.top, 6)
                                    .padding(.bottom, 4)
                                    .padding(.horizontal, 8)
                                    .background(lightGray)
                                    .cornerRadius(10)
                                    .foregroundColor(.gray)
                            }
                            
                            // Username, title, level
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Witaj, \(userProfile.userInfo!.username)!")
                                    .font(.title)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text("Honorowy dawca krwi II")
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .padding(.top, 2)
                                
                                Text("Poziom: \(userProfile.userInfo!.exp_details.level)")
                                    .foregroundColor(Color.black.opacity(0.7))
                            }
                            .padding(.leading, 20)
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        
                        HStack {
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                self.index = 0
                            }) {
                                Text("Odznaki")
                                    .foregroundColor(self.index == 0 ? Color.white : .black)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 50)
                                    .background(self.index == 0 ? Color.red : lightGray)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                self.index = 1
                            }) {
                                Text("Medale")
                                    .foregroundColor(self.index == 1 ? Color.white : .black)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 50)
                                    .background(self.index == 1 ? Color.red : lightGray)
                                    .cornerRadius(10)
                            }
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 8)
                        .cornerRadius(8)
                        .padding(.top, 25)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 15) {
                                VStack(spacing: 20) {
                                    Image("odznaka_1")
         
                                        .frame(width: 90, height: 90)
                                    
                                    Text("Zasłużony Honorowy Dawca Krwi III stopnia")
                                        .font(.subheadline)
                                        .padding(.top, 10)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    ProgressView(value: 1)
                                        .progressViewStyle(LinearProgressViewStyle())
                                        .frame(height: 4)
                                        .padding(.horizontal)
                                        .cornerRadius(2)
                                    
                                    Text("Odblokowano")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 8, y: 8)
                                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                                
                                VStack(spacing: 20) {
                                    Image("odznaka_2")
                                        .frame(width: 80, height: 80)
                                    
                                    Text("Zasłużony Honorowy Dawca Krwi II stopnia")
                                        .font(.subheadline)
                                        .padding(.top, 10)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    ProgressView(value: 0.75)
                                        .progressViewStyle(LinearProgressViewStyle())
                                        .frame(height: 4)
                                        .padding(.horizontal)
                                        .cornerRadius(2)
                                    
                                    Text("Nieodblokowano")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                }
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 8, y: 8)
                                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                                
                                VStack(spacing: 20) {
                                    Image("odznaka_3")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    
                                    Text("Zasłużony Honorowy Dawca Krwi II stopnia")
                                        .font(.subheadline)
                                        .padding(.top, 10)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Text("Zablokowane")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .opacity(0.6)
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                                
                                VStack(spacing: 17) {
                                    Image("odznaka_4")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    
                                    Text("Honorowy Dawca Krwi: Zasłużony dla Zdrowia Narodu")
                                        .font(.subheadline)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.center)
                                    
                                    Text("Zablokowane")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .opacity(0.6)
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                            }
                        }
                        
                        Spacer()
                    }
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                    .navigationBarItems(trailing: NavigationLink(destination: LoginView().navigationBarHidden(true)) {
                        Text("Wyloguj")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.red)
                            .cornerRadius(10)
                        }
                    )
                case .error:
                    Spacer()
                    Text("Wczytujemy twoje dane. Spróbuj za chwilę.")
                        .padding(.horizontal, 24)
                    Button {
                        userProfile.forceInit()
                    } label: {
                        Text("Ok")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 50)
                            .background(Color.black)
                    }
                    .cornerRadius(10)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                    Spacer()
                case .notStarted, .loading:
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(1.6)
                        .padding(.top, 26)
                    Spacer()
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

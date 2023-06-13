import SwiftUI

struct BloodBadge : Identifiable {
    let id: Int
    let text: String
}

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
                            
                            // Username, title, level, exp
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Witaj, \(userProfile.userInfo!.username)!")
                                    .font(.title)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text("Dawca Krwi")
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .padding(.top, 2)
                                
                                Text("Poziom: \(userProfile.userInfo!.exp_details.level)")
                                    .foregroundColor(Color.black.opacity(0.7))
                                
                                HStack() {
                                    let expPercentage = (Float(userProfile.userInfo!.exp_details.current_experience - userProfile.userInfo!.exp_details.min_experience) / Float(userProfile.userInfo!.exp_details.max_experience - userProfile.userInfo!.exp_details.min_experience)) * 100
                                    Text("\(userProfile.userInfo!.exp_details.min_experience)")
                                        .font(.caption)
                                        .italic()
                                        .foregroundColor(Color.black.opacity(0.5))
                                    Spacer()
                                    Text("\(Int(expPercentage))%")
                                        .bold()
                                        .foregroundColor(Color.red)
                                    Spacer()
                                    Text("\(userProfile.userInfo!.exp_details.max_experience + 1)")
                                        .font(.caption)
                                        .italic()
                                        .foregroundColor(Color.black.opacity(0.5))
                                }
                                ProgressView(
                                    value: Double(userProfile.userInfo!.exp_details.current_experience - userProfile.userInfo!.exp_details.min_experience),
                                    total: Double(userProfile.userInfo!.exp_details.max_experience - userProfile.userInfo!.exp_details.min_experience)
                                    )
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .accentColor(.red)
                                
                            }
                            .padding(.leading, 20)
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        
                        // Buttons
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
                                Text("Misje")
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
                        
                        
                        // Feats - Odznaki
                        if (self.index == 0) {
                            let bloodDonorRanks = userProfile.userFeats.enumerated().first(where: {
                                $0.element.featName == "Zasłużony Dawca Krwi"
                                || $0.element.featName == "Zasłużona Dawczyni Krwi"
                            })
                            let achievedRanks = bloodDonorRanks?.element.achievedRanks?.map { $0.rank } ?? []

                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                let bloodBadges = [
                                    BloodBadge(id: 1, text: "Zasłużony Honorowy Dawca Krwi III stopnia"),
                                    BloodBadge(id: 2, text: "Zasłużony Honorowy Dawca Krwi II stopnia"),
                                    BloodBadge(id: 3, text: "Zasłużony Honorowy Dawca Krwi I stopnia"),
                                ]
                                LazyHStack(spacing: 15) {
                                    ForEach(bloodBadges) { badge in
                                        VStack(spacing: 20) {
                                            Image("odznaka_\(badge.id)")
                                                .resizable()
                                                .frame(width: 85, height: 115)
                                            
                                            Text(badge.text)
                                                .font(.subheadline)
                                                .padding(.top, 10)
                                                .lineLimit(nil)
                                                .fixedSize(horizontal: false, vertical: true)
                                            
                                            Text(achievedRanks.contains(badge.id) ? "Odblokowano" : "Nieodblokowano")
                                                .font(.caption)
                                                .foregroundColor(achievedRanks.contains(badge.id) ? .green : .red)
                                        }
                                        .opacity(achievedRanks.contains(badge.id) ? 1 : 0.6)
                                        .padding(.vertical)
                                        .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 8, y: 8)
                                        .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                                    }
                                }
                            }

                        }
                        
                        // Feats - Misje
                        if (self.index == 1) {
                            List(userProfile.userFeats, id:\.featId) {
                                userFeat in VStack() {
                                    Text("\(userFeat.featName)")
                                        .font(.headline)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                    Text("\(userFeat.featDescription)")
                                        .font(.caption)
                                        .italic()
                                    Spacer()
                                    HStack() {
                                        Text("Zdobyte rangi: \(userFeat.achievedRanks!.count)")
                                            .font(.caption)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                        Text("Do zdobycia: \(userFeat.nextRanks!.count)")
                                            .font(.caption)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
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
                    .onAppear() {
                        userProfile.forceInit()
                    }
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

import SwiftUI

struct ContentView: View {
    @State private var showActionSheet = false
    @State private var navigateToAddDonation = false
    @State private var navigateToAddDisqualification = false
    
    var body: some View {
        let center = BloodCenters.sampleCenters
        let bankDetails = BloodCenterBankDetails.sampleBankDetails
        
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Panel")
                }
            DonationListView()
                .tabItem{
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("Donacje")
                }
            DonationView()
                .tabItem{
                    Image(systemName: "plus.circle.fill")
                    Text("Dodaj wpis")
                }
                .onAppear {
                            showActionSheet = true
                        }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("Dodaj wpis do dziennika"),
                        message: nil,
                        buttons: [
                            .default(Text("❤️ Dodaj donację")) {
                                navigateToAddDonation = true
                            },
                            .default(Text("💔 Dyskwalifikacja")) {
                                navigateToAddDisqualification = true
                            },
                            .cancel(Text("Anuluj"))
                        ]
                    )
                }

            .background(Color.white)
            .sheet(isPresented: $navigateToAddDonation) {
                AddDonation()
            }
            .sheet(isPresented: $navigateToAddDisqualification) {
                AddDisqualification()
            }
            BloodCenterView(center: center, bankDetails: bankDetails)
                .tabItem{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Placówki")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profil")
                }
                .background(Color.white.edgesIgnoringSafeArea(.bottom))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

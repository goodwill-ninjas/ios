import SwiftUI

struct ContentView: View {
    var body: some View {
        let center = BloodCenters.sampleCenters
        let bankDetails = BloodCenterBankDetails.sampleBankDetails
        
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Panel")
                }
            DonationView()
                .tabItem{
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("Donacje")
                }
            DonationListView()
                .tabItem{
                    Image(systemName: "plus.circle.fill")
                    Text("Dodaj wpis")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct HomeView: View {
    var body: some View {
        Image("odznaka_1")
            .opacity(0.6)
            .frame(width: 50, height: 50)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
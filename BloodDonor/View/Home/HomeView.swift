import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("BD_full")
                    .resizable()
                    .scaledToFill()
                    .frame(width:350, height: 350)
                    .clipped()
                Spacer()
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .shadow(radius: 10)
                    .frame(height: 120)
                    .padding(10)
                    .overlay(
                        HStack {
                            Image("blood_full")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
            
                            VStack(alignment: .leading) {
                                Text("Kolejną donację możesz oddać:")
                                    .font(.headline)
                                
                                Text(viewModel.formattedCanDonateAfter)
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.trailing, 16)
                    )
                Spacer(minLength: 100)
            }
            .navigationBarTitle("Cześć, \(UserDefaultsWorker.shared.getDisplayName() ?? "") \n dobrze Cię widzieć!")
    
        }
    }
}

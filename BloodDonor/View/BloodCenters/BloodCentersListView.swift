import SwiftUI

struct BloodCentersListView: View {
    @EnvironmentObject var bloodCentersVm: BloodCentersViewModel
    
    var body: some View {
        VStack {
            switch bloodCentersVm.checkProgress {
            case .finished:
                List(bloodCentersVm.bloodCenters, id: \.id) { bloodCenter in
                    HStack() {
                        Text("🏥")
                        Text(bloodCenter.name)
                            .font(.headline)
                    }
                }
            case .error:
                Spacer()
                Text("An error occurred while loading data")
                    .padding(.horizontal, 24)
                Button {
                    bloodCentersVm.getBloodCenters()
                } label: {
                    Text("Retry")
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
        .navigationBarTitle("Lista Placówek", displayMode: .inline)
        .onAppear {
            if bloodCentersVm.bloodCenters.isEmpty {
                bloodCentersVm.getBloodCenters()
            }
        }
    }
}
struct BloodCentersListView_Previews: PreviewProvider {
    static var previews: some View {
        BloodCentersListView()
    }
}

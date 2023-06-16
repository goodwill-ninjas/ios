import SwiftUI

struct BloodCentersListView: View {
    @EnvironmentObject var bloodCentersVm: BloodCentersViewModel
    @State private var seafarerControl: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                switch bloodCentersVm.checkProgress {
                case .finished:
                    List(bloodCentersVm.bloodCenters, id: \.id) { bloodCenter in
                        NavigationLink {
                            BloodCentersDetailView(city: bloodCenter.city)
                        } label: {
                            VStack{
                                HStack() {
                                    Text("🏥")
                                        .font(.system(size: 50))
                                    VStack (alignment: .leading){
                                        Text(bloodCenter.name)
                                            .font(.headline)
                                        Text("Województwo \(bloodCenter.voivodeship)")
                                            .font(.subheadline)
                                    }
                                }
                                
                            }
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
            .navigationBarTitle("Lista Placówek")
            .onAppear {
                if bloodCentersVm.bloodCenters.isEmpty {
                    bloodCentersVm.getBloodCenters()
                }
            }
        }
    }
}

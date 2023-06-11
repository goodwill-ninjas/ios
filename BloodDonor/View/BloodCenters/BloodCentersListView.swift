import SwiftUI

struct BloodCentersListView: View {
    @EnvironmentObject var bloodCentersVm: BloodCentersViewModel
    
    var body: some View {
        VStack {
            switch bloodCentersVm.checkProgress {
            case .finished:
                ZStack {
                    VStack(spacing: 0) {
                        ScrollView {
                            List(bloodCentersVm.bloodCenters, id: \.id) { bloodCenter in
                                VStack(alignment: .leading) {
                                    Text("🏥")
                                    Text(bloodCenter.name)
                                        .font(.headline)
                                }
                            }
                        }
                        
                        VStack {
                            Spacer()
                            Button {
                                bloodCentersVm.getBloodCenters()
                            } label: {
                                Image(systemName: "arrow.clockwise")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .frame(width: 30, height: 30)
                                    .padding(10)
                                    .background(Circle().fill(Color.black))
                                    .padding(.bottom, 20)
                            }
                            .opacity(0.9)
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

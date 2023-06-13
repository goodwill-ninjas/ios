//
//  BloodCentersDetailView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import SwiftUI
import CoreLocation

struct BloodCentersDetailView: View {
    @EnvironmentObject var bloodCentersDetailVm: BloodCentersDetailViewModel
    var city: String
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    var region: CLLocationCoordinate2D?
    
    init(city: String) {
        self.city = city
        
    }
    
    var body: some View {
        VStack {
            switch bloodCentersDetailVm.checkProgress {
            case .finished:
                // TODO: Restore MapView
//                BloodCenterMapView(coordinate: region!)
//                    .ignoresSafeArea(edges: .top)
//                    .frame(height: 100)
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(bloodCentersDetailVm.bloodCenterBankDetails!.name)
                            .font(.title)
                        
                        HStack {
                            Text(bloodCentersDetailVm.bloodCenterBankDetails!.street_name + " " + bloodCentersDetailVm.bloodCenterBankDetails!.street_number)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        Divider()
                        
                        if let openFrom = bloodCentersDetailVm.bloodCenterBankDetails!.open_from, let openTo = bloodCentersDetailVm.bloodCenterBankDetails!.open_to {
                            VStack {
                                Text("Godziny otwarcia")
                                    .font(.title2)
                                Text("Otwarte od: \(openFrom)")
                                Text("Otwarte do: \(openTo)")
                            }
                        }
                        
                        Text("Zapasy krwi")
                            .font(.title2)
                        VStack {
                            ForEach(bloodCentersDetailVm.bloodCenterBankDetails!.blood_center_details!, id: \.id) { bloodCenter in
                                HStack {
                                    Text(bloodCenter.blood_type)
                                    Spacer()
                                    
                                    ForEach(1...imageCount(for: bloodCenter.capacity), id: \.self) { _ in
                                        Image("droplet")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .alignmentGuide(.leading) { _ in 20 }
                                    }
                                }
                            }
                        }
                        
                        
                    }
                }
                
                .padding()
                
                Spacer()
                Button(action: {
                    guard let phoneNumber = bloodCentersDetailVm.bloodCenterBankDetails?.phone_number,
                          let number = URL(string: "tel://" + phoneNumber) else { return }
                    if UIApplication.shared.canOpenURL(number) {
                        UIApplication.shared.open(number)
                    } else {
                        print("Can't open url on this device")
                    }
                    
                }, label: {
                    Text("📞 Zadzwoń do centrum")
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
            case .error:
                Spacer()
                Text("An error occurred while loading data")
                    .padding(.horizontal, 24)
                Button {
                    bloodCentersDetailVm.getBloodCenterById(city: city)
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
        .onAppear {
            if bloodCentersDetailVm.bloodCenters.isEmpty {
                bloodCentersDetailVm.getBloodCenterById(city: city)
            }
        }
    }
    
//    private mutating func calculateGeoCoordinates() {
//        let geoCoordinatesArr = bloodCentersDetailVm.bloodCenterBankDetails!.geo_coordinates.components(separatedBy: ", ")
//        // Add variable to substring geoCoordinates into latitude & longitude
//        latitude = Double(geoCoordinatesArr[0])!
//        longitude = Double(geoCoordinatesArr[1])!
//        region = CLLocationCoordinate2D(latitude: self.latitude!, longitude: self.longitude!)
//    }
}

private func imageCount(for capacity: String) -> Int {
    switch capacity {
    case "STOP":
        return 5
    case "ALMOST_FULL":
        return 4
    case "OPTIMAL":
        return 3
    case "MODERATE":
        return 2
    case "CRITICAL":
        return 1
    default:
        return 0
    }
}

//struct BloodCentersDetailView_Previews: PreviewProvider {
//   static var previews: some View {
//       BloodCentersDetailView()
//   }
//}


//
//  BloodCentersDetailView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import SwiftUI
import CoreLocation

struct BloodCentersDetailView: View {
    @EnvironmentObject var bloodCentersVm: BloodCentersViewModel
    var city: String
    //    var bankDetails: [BloodCenterBankDetails]
    //    let latitude: CLLocationDegrees
    //    let longitude: CLLocationDegrees
    //    var region: CLLocationCoordinate2D
    //   let bloodCenterDataService: BloodCenterDataService
    
    init(city: String) {
        self.city = city
        //        self.center = center
        //        self.bankDetails = bankDetails
        //        let geoCoordinatesArr = bloodCentersVm.geo_coordinates.components(separatedBy: ", ")
        ////
        ////        // Add variable to substring geoCoordinates into latitude & longitude
        //        self.latitude = Double(geoCoordinatesArr[0])!
        //        self.longitude = Double(geoCoordinatesArr[1])!
        //        region = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        ////        self.bloodCenterDataService = BloodCenterDataService()
    }
        
        var body: some View {
            VStack {
                //            BloodCenterMapView(coordinate: region)
                //                .ignoresSafeArea(edges: .top)
                //                .frame(height: 100)
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(bloodCentersVm.bloodCenters.first(where: { $0.city == city })?.name ?? "")
                            .font(.title)
                        
                        HStack {
                            Text(bloodCentersVm.bloodCenters.first(where: { $0.city == city })?.street_name ?? "") // + " " + bloodCentersVm.streetNumber)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        Divider()
                        
                        if let openFrom = bloodCentersVm.bloodCenters.first(where: { $0.city == city })?.open_from, let openTo = bloodCentersVm.bloodCenters.first(where: { $0.city == city })?.open_to {
                            VStack {
                                Text("Godziny otwarcia")
                                    .font(.title2)
                                Text("Otwarte od: \(openFrom)")
                                Text("Otwarte do: \(openTo)")
                            }
                        }
                        
                        Text("Zapasy krwi")
                            .font(.title2)
                            .onAppear() {
                                //                         bloodCenterDataService.fetchBloodCenterBankDetails(city: center.city)
                            }
                        //                    VStack {
                        //                        ForEach(bloodCentersVm, id: \.bloodType) { detail in
                        //                            HStack {
                        //                                Text(detail.bloodType)
                        //                                Spacer()
                        //
                        //                                ForEach(1...imageCount(for: detail.capacity), id: \.self) { _ in
                        //                                    Image("droplet")
                        //                                        .resizable()
                        //                                        .frame(width: 20, height: 20)
                        //                                        .alignmentGuide(.leading) { _ in 20 }
                        //                                }
                        //                            }
                        //                        }
                        //                    }
                        
                    }
                }
                
                .padding()
                
                Spacer()
                Button(action: {
                    guard let phoneNumber = bloodCentersVm.bloodCenters.first(where: { $0.city == city })?.phone_number,
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
            }
            //        .onAppear() {
            //            if bloodCentersVm.bloodCenters.isEmpty {
            //                bloodCentersVm.getBloodCenterById(city: city)
            //            }
            //        }
        }
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


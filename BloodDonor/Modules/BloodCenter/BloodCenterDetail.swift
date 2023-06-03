//
//  BloodCenterDetail.swift
//  BloodDonor
//
//  Created by Adam Jurkiewicz on 03/06/2023.
//

import SwiftUI
import CoreLocation

struct BloodCenterDetail: View {
    var center: BloodCenters
    var bankDetails: [BloodCenterBankDetails]
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    var region: CLLocationCoordinate2D
    let bloodCenterDataService: BloodCenterDataService
    
    init(center: BloodCenters, bankDetails: [BloodCenterBankDetails]) {
        self.center = center
        self.bankDetails = bankDetails
        let geoCoordinatesArr = center.geoCoordinates.components(separatedBy: ", ")
        
        // Add variable to substring geoCoordinates into latitude & longitude
        self.latitude = Double(geoCoordinatesArr[0])!
        self.longitude = Double(geoCoordinatesArr[1])!
        region = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        self.bloodCenterDataService = BloodCenterDataService()
    }
    
    
    var body: some View {
        VStack {
            BloodCenterMapView(coordinate: region)
                .ignoresSafeArea(edges: .top)
                .frame(height: 100)
            ScrollView {
                VStack(alignment: .leading) {
                    Text("📍" + center.name)
                        .font(.title)

                    HStack {
                        Text(center.streetName + " " + center.streetNumber)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                    Divider()
                    
                    if let openFrom = center.openFrom, let openTo = center.openTo {
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
                             bloodCenterDataService.fetchBloodCenterBankDetails(city: center.city)
                        }
                    VStack {
                        ForEach(bankDetails, id: \.bloodType) { detail in
                            HStack {
                                Text(detail.bloodType)
                                Spacer()

                                ForEach(1...imageCount(for: detail.capacity), id: \.self) { _ in
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
                guard let number = URL(string: "tel://" + center.phoneNumber) else { return }
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

struct BloodCenterDetail_Previews: PreviewProvider {
    static var previews: some View {
        let center = BloodCenters.sampleCenters
        let bankDetails = BloodCenterBankDetails.sampleBankDetails
        BloodCenterDetail(center: center[0], bankDetails: bankDetails)
    }
}

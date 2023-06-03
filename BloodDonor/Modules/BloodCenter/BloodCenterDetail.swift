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
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    var region: CLLocationCoordinate2D
    
    init(center: BloodCenters) {
        self.center = center
        let geoCoordinatesArr = center.geoCoordinates.components(separatedBy: ", ")
        
        // Add variable to substring geoCoordinates into latitude & longitude
        self.latitude = Double(geoCoordinatesArr[0])!
        self.longitude = Double(geoCoordinatesArr[1])!
        region = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    
    var body: some View {
        VStack {
            BloodCenterMapView(coordinate: region)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

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

struct BloodCenterDetail_Previews: PreviewProvider {
    static var previews: some View {
        let center = BloodCenters.sampleCenters
        BloodCenterDetail(center: center[0])
    }
}

//
//  BloodCenterMapView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import SwiftUI
import MapKit

struct BloodCenterMapView: View {
    var coordinate: CLLocationCoordinate2D
        @State private var region = MKCoordinateRegion()

        var body: some View {
            Map(coordinateRegion: $region)
                .onAppear {
                    setRegion(coordinate)
                }
        }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        )
    }
}

//struct BloodCenterMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        BloodCenterMapView()
//    }
//}

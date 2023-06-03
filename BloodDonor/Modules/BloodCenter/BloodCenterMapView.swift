//
//  BloodCenterMapView.swift
//  BloodDonor
//
//  Created by Adam Jurkiewicz on 03/06/2023.
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
            span: MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8)
        )
    }
}

struct BloodCenterMapView_Previews: PreviewProvider {
    static var previews: some View {
        BloodCenterMapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}

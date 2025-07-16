//
//  MapView.swift
//  Landmarks
//
//  Created by Abcom on 16/07/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    private var region:MKCoordinateRegion {
        MKCoordinateRegion(
                  center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
                  span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
              )
    }
    
    var body: some View {
        Map(initialPosition:.region(region))
    }
}

#Preview {
    MapView()
}

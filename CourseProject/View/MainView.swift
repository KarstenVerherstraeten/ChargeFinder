//
//  MainView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI
import MapKit
let locationManager = CLLocationManager()


struct MainView: View {
    @StateObject var fetchChargingPorts = FetchChargingPorts() // Create an instance of FetchChargingPorts
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: fetchChargingPorts.posts) { chargingPort in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(chargingPort.wgs84_lat) ?? 0, longitude: Double(chargingPort.wgs84_long) ?? 0)) {
                // Customize the annotation view here if needed
                Text(chargingPort.adrvoisnl)
            }
        }
        .onAppear{
            fetchChargingPorts.fetchPosts() // Corrected method call
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MainView()
}

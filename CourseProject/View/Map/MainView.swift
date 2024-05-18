//
//  MainView.swift
//  CourseProject
//  Partialy helped by ChatGPT
//  Created by Karsten Verherstraeten on 19/04/2024.
//

import SwiftUI
import MapKit

let locationManager = CLLocationManager()

struct MainView: View {
    @StateObject var fetchChargingPorts = FetchChargingPorts()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var selectedAnnotation: ChargingPortAnnotation? = nil
    @State private var isCalloutVisible = false

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: fetchChargingPorts.posts.map { ChargingPortAnnotation(chargingPort: $0) }) { annotation in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(annotation.chargingPort.wgs84_lat) ?? 0, longitude: Double(annotation.chargingPort.wgs84_long) ?? 0)) {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(Color.yellow) // Set thunderbolt color to yellow
                        .font(.title)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                                                
                        .onTapGesture {
                            withAnimation {
                                selectedAnnotation = annotation
                                isCalloutVisible.toggle()
                            }
                        }
                }
            }
            .overlay(
                isCalloutVisible ? ChargingPortCalloutView(chargingPort: selectedAnnotation!.chargingPort, isShowing: $isCalloutVisible)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    : nil
            )
           
        }
        .onAppear {
            fetchChargingPorts.fetchPosts()
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MainView()
}

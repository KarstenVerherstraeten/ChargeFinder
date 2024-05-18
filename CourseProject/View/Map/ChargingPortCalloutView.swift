//
//  ChargingPortCalloutView.swift
//  CourseProject
//  Styling suggestions by ChatGPT finalized by Karsten
//  Created by Karsten Verherstraeten on 11/05/2024.
//

import SwiftUI

struct ChargingPortCalloutView: View {
    let chargingPort: ChargingPort
    @Binding var isShowing: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Text(chargingPort.adrvoisnl)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Latitude: \(chargingPort.wgs84_lat), Longitude: \(chargingPort.wgs84_long)")
                        .font(.body)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        print("Set Route to: \(chargingPort.adrvoisnl)")
                        withAnimation {
                            isShowing.toggle()
                        }
                    }) {
                        Text("Set Route")
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 75)
                    
                    Button(action: {
                       
                        withAnimation {
                            isShowing.toggle()
                        }
                    }) {
                        Text("Sluiten")
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow) //
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                }
                .padding()
                .frame(width: geometry.size.width * 0.8)
                .background(Color.black)
                .cornerRadius(10)
                .shadow(radius: 5)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ChargingPortCalloutView(chargingPort: ChargingPort(nr: "1", adrvoisnl: "Sample Address", gemeente: "Sample City", wgs84_long: "4.0", wgs84_lat: "50.0"), isShowing: .constant(true))
}

//
//  MainView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI
import MapKit

struct MainView: View {
    @StateObject var data = FetchChargingPorts()
    var body: some View {
        Map()
        
      
        
    }
}

#Preview {
    MainView()
}

//
//  ContentView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedTab = 1
    @ObservedObject var networkManager = NetworkManager.shared // Use the shared instance
    
    var body: some View {
        TabView(selection: $selectedTab){
            ListView()
                .tabItem {
                    Label("Chargers", systemImage: "list.triangle")
                }.tag(0)
                .accentColor(Color.yellow) // Set tab bar accent color to yellow
            
            MainView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }.tag(1)
                .accentColor(Color.yellow) // Set tab bar accent color to yellow
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }.tag(2)
                .accentColor(Color.yellow) // Set tab bar accent color to yellow
        }
        .accentColor(Color.yellow) // Set overall accent color to yellow
    }
}
#Preview {
    ContentView()
}

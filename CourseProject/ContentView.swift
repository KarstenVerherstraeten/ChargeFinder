//
//  ContentView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab){
            ListView()
                    .tabItem {
                        Label("Chargers", systemImage: "list.triangle")
                    }.tag(0)
            
            MainView().tabItem{ Label("map", systemImage: "map")}.tag(1)
            
            profileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }.tag(2)
            
        }
    }
}

#Preview {
    ContentView()
}

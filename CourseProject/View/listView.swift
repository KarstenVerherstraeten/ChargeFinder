//
//  listView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI

struct ListView: View {
    @StateObject var data = FetchChargingPorts()
    @State private var lastUpdated: Date? // Variable to store last update time
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List(data.posts) { charger in
                    NavigationLink(destination: ChargerDetailedView(charger: charger)) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(charger.gemeente)
                                .font(.headline)
                            Text(charger.adrvoisnl)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(GroupedListStyle()) // Apple standard list style
                
                .onAppear {
                    data.fetchPosts() // Fetch data when the view appears
                    // Retrieve the last updated time from UserDefaults
                    if let cachedTime = UserDefaults.standard.object(forKey: "lastUpdatedTime") as? Date {
                        lastUpdated = cachedTime
                    }
                }
                .onReceive(data.$posts) { _ in
                    // Update the last updated time when new data is received and cached
                    lastUpdated = Date()
                    // Save the new last updated time to UserDefaults
                    UserDefaults.standard.set(lastUpdated, forKey: "lastUpdatedTime")
                }
                
                // Display last updated time
                if let lastUpdated = lastUpdated {
                    Text("Last Updated: \(formattedLastUpdatedDate(lastUpdated))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Charging Ports")
        }
    }
    
    // Method to format last updated date
    private func formattedLastUpdatedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    ListView()
}

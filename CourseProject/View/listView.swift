//
//  listView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 29/03/2024.
//

import SwiftUI

struct ListView: View {
    @StateObject var data = FetchChargingPorts()

    var body: some View {
        NavigationView { // Wrap the List in a NavigationView
            VStack(alignment: .center) {
                List(data.posts) { charger in
                    NavigationLink(destination: ChargerDetailedView(charger: charger)) {
                        VStack(alignment: .leading) {
                            Text(charger.gemeente)
                                .font(.headline)
                            Text(charger.adrvoisnl)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Charging Ports") // Set a navigation title
        }
        .onAppear {
            data.fetchPosts()
        }
    }
}



#Preview {
    profileView()
}

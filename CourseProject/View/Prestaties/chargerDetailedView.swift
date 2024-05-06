//
//  chargerDetailedView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 19/04/2024.
//

import SwiftUI

struct ChargerDetailedView: View {
    let charger: ChargingPort

    var body: some View {
        VStack {
            Text(charger.gemeente)
                .font(.title)
            Text(charger.adrvoisnl)
                .font(.subheadline)
            // Add more details here as needed
        }
        .padding()
        .navigationTitle("Charger Details")
    }
}



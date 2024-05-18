//
//  ChargerDetailedView.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 19/04/2024.
//

import SwiftUI

struct ChargerDetailedView: View {
    let charger: ChargingPort

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(charger.gemeente)
                .font(.largeTitle)
            Text(charger.adrvoisnl)
                .font(.headline)
        }
        .padding()
        .navigationTitle("Charger Details")
    }
}

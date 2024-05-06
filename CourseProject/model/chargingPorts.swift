//
//  chargingPorts.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 19/04/2024.
//

import Foundation

struct ChargingPort: Codable, Identifiable {
    var id: String {
        return "\(nr)"
    }
    let nr: String
    let adrvoisnl: String
    let gemeente: String
    let wgs84_long: String
    let wgs84_lat: String
}

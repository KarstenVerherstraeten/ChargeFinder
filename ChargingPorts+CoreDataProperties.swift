//
//  ChargingPorts+CoreDataProperties.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 07/05/2024.
//
//

import Foundation
import CoreData


extension ChargingPorts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChargingPorts> {
        return NSFetchRequest<ChargingPorts>(entityName: "ChargingPorts")
    }
    
    @NSManaged public var id: String?
    @NSManaged public var adrvoisnl: String?
    @NSManaged public var gemeente: String?
    @NSManaged public var wgs84_long: String?
    @NSManaged public var wgs84_lat: String?

}

extension ChargingPorts : Identifiable {

}

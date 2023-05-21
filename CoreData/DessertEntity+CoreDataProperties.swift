//
//  DessertEntity+CoreDataProperties.swift
//  
//
//  Created by Apple on 21/05/2023.
//
//

import Foundation
import CoreData


extension DessertEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DessertEntity> {
        return NSFetchRequest<DessertEntity>(entityName: "DessertEntity")
    }

    @NSManaged public var name: String?

}

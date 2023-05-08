//
//  Planets+CoreDataProperties.swift
//  List
//
//  Created by Aghish Babu on 06/05/23.
//
//

import Foundation
import CoreData


extension Planets {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planets> {
        return NSFetchRequest<Planets>(entityName: "Planets")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var population: String?
    
}

extension Planets : Identifiable {
    
}

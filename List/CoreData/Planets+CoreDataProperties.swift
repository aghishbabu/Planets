//
//  Planets+CoreDataProperties.swift
//  List
//
//  Created by Aghish Babu on 17/02/22.
//
//

import Foundation
import CoreData


extension Planets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planets> {
        return NSFetchRequest<Planets>(entityName: "Planets")
    }

    @NSManaged public var name: String?

}

extension Planets : Identifiable {

}

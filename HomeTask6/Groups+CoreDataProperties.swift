//
//  Groups+CoreDataProperties.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 28.02.2024.
//

import Foundation
import CoreData


extension Groups {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Groups> {
        return NSFetchRequest<Groups>(entityName: "Groups")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var descr: String?
    @NSManaged public var photo: String?

}

extension Groups : Identifiable {

}
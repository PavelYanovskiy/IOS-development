//
//  GroupsDate+CoreDataProperties.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 28.02.2024.
//

import Foundation
import CoreData


extension GroupsDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupsDate> {
        return NSFetchRequest<GroupsDate>(entityName: "GroupsDate")
    }

    @NSManaged public var date: Date?

}

extension GroupsDate : Identifiable {

}

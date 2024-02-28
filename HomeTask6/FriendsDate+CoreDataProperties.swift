//
//  FriendsDate+CoreDataProperties.swift
//  HomeTask1_No_Storyboard
//
//  Created by Павел Яновский on 28.02.2024.
//

import Foundation
import CoreData


extension FriendsDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendsDate> {
        return NSFetchRequest<FriendsDate>(entityName: "FriendsDate")
    }

    @NSManaged public var date: Date?

}

extension FriendsDate : Identifiable {

}

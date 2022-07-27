//
//  UserProfile+CoreDataProperties.swift
//  
//
//  Created by khoirunnisa' rizky noor fatimah on 27/07/22.
//
//

import Foundation
import CoreData


extension UserProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfile> {
        return NSFetchRequest<UserProfile>(entityName: "UserProfile")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: String?
    @NSManaged public var isShowingAge: Bool

}

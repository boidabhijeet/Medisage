//
//  MedisageTestEntity+CoreDataProperties.swift
//  MedisageTest
//
//  Created by Abhi on 23/08/21.
//
//

import Foundation
import CoreData


extension MedisageTestEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MedisageTestEntity> {
        return NSFetchRequest<MedisageTestEntity>(entityName: "MedisageTestEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension MedisageTestEntity : Identifiable {

}

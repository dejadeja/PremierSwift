//
//  MovieManagedObject.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 05/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import CoreData

@objc(MovieManagedObject)
class MovieManagedObject: NSManagedObject {
    //MARK: - Properties
    @NSManaged var title: String?
    @NSManaged var overview: String?
    @NSManaged var uid: NSNumber?
    @NSManaged var image: Data?
}

//
//  RealmManager.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 06/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    //MARK: - Properties
    let realm: Realm = try! Realm()

     var movies: Results<RealmMovie> {
        get {
            return realm.objects(RealmMovie.self)
        }
    }

    
    //MARK: - Save objects to Realm
    static func saveMoviesToRealm(movies: [RealmMovie]) {
        movies.forEach { movie in
            let realm = try! Realm()
            try! realm.write {
                realm.add(movie)
            }
        }
    }
    
    //MARK: - Get objects from realm
    static func retrieveMoviesFromRealm() -> Results<RealmMovie> {
        let realmManager = RealmManager()
        return realmManager.movies
    }
}

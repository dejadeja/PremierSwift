//
//  MovieCoreDataStore.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 05/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

protocol MovieCoreDataStoreDelegate {
    static func saveToCoreData()
    static func fetchFromCoreData()
    static func deleteFromCoreData()
}

class MovieCoreDataStore: MovieCoreDataStoreDelegate {
    //MARK: - Save
    static func saveToCoreData() {
        
    }

    //MARK: - Fetch
    static func fetchFromCoreData() {
        
    }

    //MARK: - Delete
    static func deleteFromCoreData() {
        
    }
}

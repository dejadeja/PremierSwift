//
//  MovieCoreDataStore.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 05/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import CoreData

protocol MovieCoreDataStoreDelegate {
    static func saveToCoreData(movies: [Movie])
    static func fetchFromCoreData()
    static func deleteFromCoreData()
}

class MovieCoreDataStore: MovieCoreDataStoreDelegate {
    struct Consts {
        static let movieEntityDescription = "MovieEntity"
    }
    
    //MARK: - Save Moviews to Core Data
    static func saveToCoreData(movies: [Movie]) {
        movies.forEach { movie in
            let newMovie = NSEntityDescription.insertNewObject(forEntityName: Consts.movieEntityDescription, into: CoreDataStack.persistentContainer.viewContext)
            newMovie.setValue(movie.title, forKey: "title")
            newMovie.setValue(movie.posterPathEndpoint, forKey: "image")
            newMovie.setValue(movie.overview, forKey: "overview")
        }
        
        do {
            try CoreDataStack.managedObjectContext.save()
        } catch {
            fatalError("Failed to save context: \(error)")
        }
    }

    //MARK: - Fetch
    static func fetchFromCoreData() {
        
    }

    //MARK: - Delete
    static func deleteFromCoreData() {
        
    }
}

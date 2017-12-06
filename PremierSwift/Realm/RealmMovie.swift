//
//  RealmMovie.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 06/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMovie: Object {
    //MARK: - Properties
    @objc dynamic var movieTitle: String = ""
    @objc dynamic var movieOverview: String = ""
    @objc dynamic var movieThumbnailImageURL: String = ""
    
    static func initRealmMovie(withMovie movie: Movie) -> RealmMovie? {
        let realmMovie = RealmMovie()
        
        guard
            let title = movie.title,
            let overview = movie.overview,
            let posterPathEndpoint = movie.posterPathEndpoint else {
            return nil
        }
        
        realmMovie.movieTitle = title
        realmMovie.movieOverview = overview
        realmMovie.movieThumbnailImageURL = posterPathEndpoint
        return realmMovie
    }
}

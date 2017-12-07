//
//  Movie.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Technical Test. All rights reserved.
//

import Foundation

struct Movie: Encodable {
    //MARK: - Properties
    public var title: String?
    public var overview: String?
    public var posterPathEndpoint: String?

    enum CodingKeys: String, CodingKey {
        case posterPathEndpoint = "poster_path"
    }
    
    //MARK: - Parse movies
    static func parseMovie(jsonArray array: APIService.JSONArrayType) -> [Movie] {
        var movies: [Movie] = []
        
        array.forEach { movie in
            guard
                let movieDict = movie as? APIService.JSONDictionaryType,
                let title = movieDict["title"] as? String,
                let overview = movieDict["overview"] as? String,
                let posterPath = movieDict["poster_path"] as? String else {
                return
            }
            
            let currentMovie = Movie(title: title, overview: overview, posterPathEndpoint: posterPath)
            movies.append(currentMovie)
        }
        
        return movies
    }
}

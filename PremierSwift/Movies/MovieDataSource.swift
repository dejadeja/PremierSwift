//
//  MovieDataSource.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

class MovieDataSource {
    //MARK: - Properties
    private var movies: [Movie] = []
    
    //MARK: - Initialiser
    init(movies: [Movie]) {
        self.movies = movies
    }
}

extension MovieDataSource {
    public var numberOfMovies: Int {
        return movies.count
    }
    
    public func movieTitle(atIndex index: Int) -> String? {
        return objectAtIndex(atIndex: index).title
    }
    
    public func movieOverView(atIndex index: Int) -> String? {
        return objectAtIndex(atIndex: index).overview
    }
    
    public func movieThumbnailImage(atIndex index: Int) -> String? {
        return objectAtIndex(atIndex: index).posterPathEndpoint
    }
    
    private func objectAtIndex(atIndex index: Int) -> Movie {
        return movies[index]
    }
}

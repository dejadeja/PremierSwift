//
//  MovieDataSource.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MovieDataSource {
    //MARK: - Properties
    fileprivate var movies: Results<RealmMovie>?
    private let cache = NSCache<NSNumber, UIImage>()

    //MARK: - Initialiser
    init(movies: Results<RealmMovie>) {
        self.movies = movies
    }
}

//MARK: - Retriever functions
extension MovieDataSource {
    public var numberOfMovies: Int {
        return movies!.count
    }
    
    public func movieTitle(atIndex index: Int) -> String? {
        return objectAtIndex(atIndex: index).movieTitle
    }
    
    public func movieOverView(atIndex index: Int) -> String? {
        return objectAtIndex(atIndex: index).movieOverview
    }

    public func movieThumbnailImageURL(atIndex index: Int) -> URL? {
        let endpoint = objectAtIndex(atIndex: index).movieThumbnailImageURL
        return URL(string: "\(APIService.Consts.mediaBaseURL)\(endpoint)")
    }
    
    private func objectAtIndex(atIndex index: Int) -> RealmMovie {
        return movies![index]
    }
}

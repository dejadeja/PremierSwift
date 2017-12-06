//
//  MovieDataSource.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import UIKit

class MovieDataSource {
    //MARK: - Properties
    private var movies: [Movie] = []
    private let cache = NSCache<NSNumber, UIImage>()

    //MARK: - Initialiser
    init(movies: [Movie]) {
        self.movies = movies
    }
}

//MARK: - Retriever functions
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
    
    public func movieThumbnailImage(atIndex index: Int, completion: @escaping APIService.MovieImageCompletionType) {
        guard let cachedImage = cache.object(forKey: NSNumber(value: index)) else {
            requestImage(atIndex: index, completion: { image in
                completion(image)
            })
            return
        }
        
        completion(cachedImage)
    }
    
    private func requestImage(atIndex index: Int, completion: @escaping APIService.MovieImageCompletionType) {
        let endpoint = movieThumbnailImageURL(atIndex: index)

        DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
            APIService.retrieveMoviePosterImages(thumbnailURL: endpoint!) { image in
                guard let requestedImage = image else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.cache.setObject(requestedImage, forKey: NSNumber(value: index))
                    completion(image)
                }
            }
        }
    }
    
    public func movieThumbnailImageURL(atIndex index: Int) -> String? {
        guard let endpoint = objectAtIndex(atIndex: index).posterPathEndpoint else {
            return nil
        }
        
        return "\(APIService.Consts.mediaBaseURL)\(endpoint)"
    }
    
    private func objectAtIndex(atIndex index: Int) -> Movie {
        return movies[index]
    }
}

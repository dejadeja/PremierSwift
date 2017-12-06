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
        let endpoint = objectAtIndex(atIndex: index).movieThumbnailImageURL
        return "\(APIService.Consts.mediaBaseURL)\(endpoint)"
    }
    
    private func objectAtIndex(atIndex index: Int) -> RealmMovie {
        return movies![index]
    }
}

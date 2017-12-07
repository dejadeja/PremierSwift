//
//  APIService.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import Keys

struct APIService {
    //MARK: - Properties
    public typealias MovieDataCompletionType = (Results<RealmMovie>?) -> Void
    public typealias MovieImageCompletionType = (UIImage?) -> Void
    public typealias JSONDictionaryType = [String: Any]
    public typealias JSONArrayType = [Any]

    struct Consts {
        static let baseFeedURL = "https://api.themoviedb.org/3/movie/top_rated?"
        static let mediaBaseURL = "https://image.tmdb.org/t/p/w500"
        static let defaultNode = "results"
    }
    
    static let sessionManager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    
    //MARK: - Request For Feed Data
    static func retrieveMovieData(completion: @escaping MovieDataCompletionType) {
        let apiKey = PremierSwiftKeys()
        let params = ["api_key": apiKey.movieAPIKey]
        
        APIService.sessionManager.request(APIService.Consts.baseFeedURL, parameters: params).responseJSON { dataResponse in
            guard
                let json = dataResponse.result.value as? JSONDictionaryType,
                let jsonArray = json[APIService.Consts.defaultNode] as? JSONArrayType
                else {
                    completion(nil)
                    return
            }
            
            let movies = Movie.parseMovie(jsonArray: jsonArray)
            APIService.persistMovie(movies: movies)
            completion(RealmManager.retrieveMoviesFromRealm())
        }
    }
    
    //MARK: - Request For Image Data
    static func retrieveMoviePosterImages(thumbnailURL: String, completion: @escaping MovieImageCompletionType) {
        sessionManager.request(thumbnailURL).responseData { dataResponse in
            guard let data = dataResponse.result.value else {
                return
            }
            
            completion(UIImage(data: data))
        }
    }
    
    //MARK: - Persist Data
    static func persistMovie(movies: [Movie]) {
        var realmMovies: [RealmMovie] = []
        
        movies.forEach { movie in
            guard let realmMovie = RealmMovie.initRealmMovie(withMovie: movie) else {
                return
            }
            realmMovies.append(realmMovie)
        }
        
        RealmManager.saveMoviesToRealm(newMovies: realmMovies)
    }
}

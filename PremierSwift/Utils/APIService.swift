//
//  APIService.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import Alamofire

struct APIService {
    //MARK: - Properties
    public typealias MovieDataCompletionType = ([Movie]) -> Void
    private typealias JSONDictionaryType = [String: Any]
    private typealias JSONArrayType = [Any]

    struct Consts {
        static let baseURL = "https://api.themoviedb.org/3/movie/top_rated?"
        //TODO: - Put API key in CocoaKeys
        static let apiKey = "e4f9e61f6ffd66639d33d3dde7e3159b"
        static let defaultNode = "results"
    }
    
    static let sessionManager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    
    //MARK: - Request for data
    static func retrieveMovieData(completion: @escaping MovieDataCompletionType) {
        let params = ["api_key": APIService.Consts.apiKey]
        
        sessionManager.request(APIService.Consts.baseURL, parameters: params).responseJSON { dataResponse in
            guard
                let json = dataResponse.result.value as? JSONDictionaryType,
                let jsonArray = json[APIService.Consts.defaultNode] as? JSONArrayType
                else {
                    completion([])
                return
            }
            
            var movies: [Movie] = []
            jsonArray.forEach { movie in
               guard
                    let movieDict = movie as? JSONDictionaryType,
                    let title = movieDict["title"] as? String,
                    let overview = movieDict["overview"] as? String,
                    let posterPath = movieDict["poster_path"] as? String else {
                        return
                }
                
                let currentMovie = Movie(title: title, overview: overview, posterPathEndpoint: posterPath)
                movies.append(currentMovie)
            }
            
            completion(movies)
        }
    }
}

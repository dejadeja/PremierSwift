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
    public typealias MovieImageCompletionType = (UIImage?) -> Void
    public typealias JSONDictionaryType = [String: Any]
    public typealias JSONArrayType = [Any]

    struct Consts {
        static let baseFeedURL = "https://api.themoviedb.org/3/movie/top_rated?"
        static let mediaBaseURL = "https://image.tmdb.org/t/p/w500"
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
        
        sessionManager.request(APIService.Consts.baseFeedURL, parameters: params).responseJSON { dataResponse in
            guard
                let json = dataResponse.result.value as? JSONDictionaryType,
                let jsonArray = json[APIService.Consts.defaultNode] as? JSONArrayType
                else {
                    completion([])
                return
            }
            
            let movies = Movie.parseMovie(jsonArray: jsonArray)
            completion(movies)
        }
    }
    
    static func retrieveMoviePosterImages(endPoint: String, completion: @escaping MovieImageCompletionType) {
        let mediaUrl = "\(APIService.Consts.mediaBaseURL)\(endPoint)"
        
        sessionManager.request(mediaUrl).responseData { dataResponse in
            guard let data = dataResponse.result.value else {
                return
            }
            
            let image = UIImage(data: data)
            completion(image)
        }
    }
}

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
        static let defaultNode = "results"
    }
    
    static let sessionManager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    
    //MARK: - Request for data
    static func retrieveMovieData(completion: @escaping MovieDataCompletionType) {
        let apiKey = getAPIKey()
        let params = ["api_key": apiKey]
        
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
    
    //MARK: - Gets api key from .plist
    static func getAPIKey() -> String {
        guard
            let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
            let keyDictionary = NSDictionary(contentsOfFile: path),
            let key = keyDictionary["apiKey"] as? String else {
            return ""
        }
        
        return key
    }
}

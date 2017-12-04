//
//  Movie.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

struct Movie: Codable {
    //MARK: - Properties
    public var title: String?
    public var overview: String?
    public var posterPathEndpoint: String?

    enum CodingKeys: String, CodingKey {
        case posterPathEndpoint = "poster_path"
    }
}

//
//  MovieTableViewCell.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    //MARK: - Properties
    public lazy var movieTitle: UILabel = {
        let label: UILabel = UILabel()
        return label
    }()
    
    public lazy var movieOverview: UILabel = {
        let label: UILabel = UILabel()
        return label
    }()
    
    public lazy var movieThumbnail: UIImageView = {
        let imageView: UIImageView = UIImageView()
        return imageView
    }()
    
    //MARK: - Initialiser
    
    //MARK: - Constrain to views
    private func constrainView() {
        
    }
}

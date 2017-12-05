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
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.textColor = UIColor.titleText
        label.font = UIFont.title.withSize(16.0)
        return label
    }()
    
    public lazy var movieOverview: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 6
        label.lineBreakMode =  NSLineBreakMode.byTruncatingTail
        label.textColor = UIColor.bodyText
        label.font = UIFont.body.withSize(14.0)
        return label
    }()
    
    public lazy var movieThumbnail: UIImageView = {
        let imageView: UIImageView = UIImageView()
        return imageView
    }()
    
    //MARK: - Initialiser
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        constrainViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        movieOverview.sizeToFit()
    }
    
    //MARK: - Add Subviews
    private func addSubViews() {
        self.addSubview(movieTitle)
        self.addSubview(movieOverview)
        self.addSubview(movieThumbnail)
    }
    
    //MARK: - Constrain to views
    private func constrainViews() {
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieOverview.translatesAutoresizingMaskIntoConstraints = false
        movieThumbnail.translatesAutoresizingMaskIntoConstraints = false
        
        movieOverview.topAnchor.constraint(equalTo: movieThumbnail.bottomAnchor, constant: 5.0).isActive = true
        movieOverview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0).isActive = true
        movieOverview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0).isActive = true
        movieOverview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true
        
        movieTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: movieThumbnail.trailingAnchor, constant: 8.0).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true

        movieThumbnail.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0).isActive = true
        movieThumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120.0).isActive = true
        movieThumbnail.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -250.0).isActive = true
        movieThumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
    }
}

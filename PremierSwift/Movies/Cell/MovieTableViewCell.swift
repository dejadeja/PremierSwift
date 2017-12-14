//
//  MovieTableViewCell.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Technical Test. All rights reserved.
//

import Foundation
import UIKit

protocol MovieTableCellDetailDelegate: class {
    func didSelectImageView(cell: MovieTableViewCell)
}

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
        label.numberOfLines = 0
        label.textColor = UIColor.bodyText
        label.font = UIFont.body.withSize(14.0)
        return label
    }()
    
    public lazy var movieThumbnail: UIImageView = {
        let img = UIImageView()
        img.isUserInteractionEnabled = true
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(presentDetailViewController))
        self.addGestureRecognizer(gestureRecogniser)
        return img
    }()
    
    weak var delegate: MovieTableCellDetailDelegate?

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
        movieOverview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        movieOverview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0).isActive = true
        movieOverview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true
        
        movieTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: movieThumbnail.trailingAnchor, constant: 8.0).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true

        movieThumbnail.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0).isActive = true
        movieThumbnail.widthAnchor.constraint(equalToConstant: 150).isActive = true
        movieThumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
        movieThumbnail.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    //MARK: - Present Detail
    @objc public func presentDetailViewController() {
        delegate?.didSelectImageView(cell: self)
    }
}

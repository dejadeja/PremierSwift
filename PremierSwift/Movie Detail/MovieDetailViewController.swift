//
//  MovieDetailViewController.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 14/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {
    //MARK: - Properties
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var movieOverview: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var moviesDataSource: MovieDataSource
    private var movieIndex: Int
    
    //MARK: - Initialiser
    init(dataSource: MovieDataSource, index: Int) {
        moviesDataSource = dataSource
        movieIndex = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        populateContent()
        addSubViews()
        constrainSubViews()
    }
    
    //MARK: - Populate Content
    private func populateContent() {
        movieTitle.text = moviesDataSource.movieTitle(atIndex: movieIndex)
        movieOverview.text = moviesDataSource.movieOverView(atIndex: movieIndex)
        movieImage.af_setImage(withURL: moviesDataSource.movieThumbnailImageURL(atIndex: movieIndex)!)
    }
    
    //MARK: - Add Subviews
    private func addSubViews() {
        self.view.addSubview(movieTitle)
        self.view.addSubview(movieOverview)
        self.view.addSubview(movieImage)
    }
    
    //MARK: - Constrain Subviews
    private func constrainSubViews() {
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieOverview.translatesAutoresizingMaskIntoConstraints = false
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        
        //movieTitle.tr
    }
}

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
        configureNavigationBar()
        populateContent()
        addSubViews()
        constrainSubViews()
    }
    
    //MARK: - Configure Nav bar
    public func configureNavigationBar() {
        let backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(dismissViewController))
        navigationItem.leftBarButtonItems = [backBarButtonItem]
    }
    
    //MARK: - Populate Content
    private func populateContent() {
        self.title = moviesDataSource.movieTitle(atIndex: movieIndex)
        movieOverview.text = moviesDataSource.movieOverView(atIndex: movieIndex)
        movieImage.af_setImage(withURL: moviesDataSource.movieThumbnailImageURL(atIndex: movieIndex)!)
    }
    
    //MARK: - Add Subviews
    private func addSubViews() {
        self.view.addSubview(movieOverview)
        self.view.addSubview(movieImage)
    }
    
    //MARK: - Constrain Subviews
    private func constrainSubViews() {
        movieOverview.translatesAutoresizingMaskIntoConstraints = false
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        
        guard let navigationBarHeight = self.navigationController?.navigationBar.bounds.height else {
            return
        }
        
        movieImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: navigationBarHeight).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        movieOverview.topAnchor.constraint(equalTo: movieImage.bottomAnchor).isActive = true
        movieOverview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        movieOverview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        movieOverview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    //MARK: - Dismiss VC
    @objc private func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  RootViewController.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    //MARK: - Properties
    private var loadingView: LoadingView = {
        return LoadingView()
    }()
    
    private var errorView: ErrorView = {
        return ErrorView()
    }()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loadingView)
        self.view.addSubview(errorView)
        
        constrainViewToEdges(childView: loadingView)
        constrainViewToEdges(childView: errorView)
        
        loadingView.isHidden = false
        errorView.isHidden = true
        
        initialiseDataSource()
    }
    
    //MARK: - Constrain To Edges
    private func constrainViewToEdges(childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        childView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        childView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        childView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    //MARK: - Initialise DataSource
    private func initialiseDataSource() {
        
    }
    
    //MARK: - Present ViewController
    private func presentViewController() {
        
    }
}

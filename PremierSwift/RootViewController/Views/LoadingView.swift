//
//  LoadingView.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Technical Test. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    //MARK: - Properties
    private var loadingActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    private var loadingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.body.withSize(12.0)
        label.textColor = UIColor.white
        label.text = "LOADING..."
        return label
    }()
    
    //MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.01619968191, green: 0.8010149598, blue: 0.7360114455, alpha: 1)
        
        self.addSubview(loadingActivityIndicator)
        self.addSubview(loadingLabel)
        
        constrainViewsToCenter(activityIndicator: loadingActivityIndicator, label: loadingLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Constrain Subviews
    private func constrainViewsToCenter(activityIndicator: UIActivityIndicatorView, label: UILabel) {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 25.0).isActive = true
    }
}

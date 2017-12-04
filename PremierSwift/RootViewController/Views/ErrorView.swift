//
//  ErrorView.swift
//  PremierSwift
//
//  Created by Deja Cespedes on 04/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import UIKit

class ErrorView: UIView {
    //MARK: - Properties
    private var errorLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 8.0)
        return label
    }()
    
    //MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.01619968191, green: 0.8010149598, blue: 0.7360114455, alpha: 1)
        self.addSubview(errorLabel)
        constrainViewsToCenter(label: errorLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Constrain Subviews
    private func constrainViewsToCenter(label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 25.0).isActive = true
    }
}

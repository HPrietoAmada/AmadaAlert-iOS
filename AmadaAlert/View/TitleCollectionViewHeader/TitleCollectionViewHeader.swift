//
//  TitleCollectionViewHeader.swift
//  AmadaAlert
//
//  Created by IT Support on 12/16/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

class TitleCollectionViewHeader: UICollectionReusableView {

    let BOUNDS: CGFloat = 30

    /* View Components */
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /* Constructor for View */
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.initializeViews()
    }

    func initializeViews() {
        // Add Components to View
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)

        translatesAutoresizingMaskIntoConstraints = false

        // Title Label Constraints
        self.titleLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: BOUNDS).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -BOUNDS).isActive = true

        // Description Label Constraints
        self.subtitleLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.subtitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: BOUNDS).isActive = true
        self.subtitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -BOUNDS).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

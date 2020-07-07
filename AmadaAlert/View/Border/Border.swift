//
//  Border.swift
//  AmadaAlert
//
//  Created by IT Support on 7/9/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

public class Border: UIView {

    var borderHeight: CGFloat = 0.75 {
        didSet {
            heightLayoutConstraint?.constant = borderHeight
        }
    }

    var borderColor: UIColor = .placeholder {
        didSet {
            backgroundColor = .placeholder
        }
    }

    fileprivate var heightLayoutConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setup()
    }

    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = inDarkMode() ? UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) : .placeholder
        //backgroundColor = .placeholder
        if #available(iOS 9.0, *) {
            heightLayoutConstraint = heightAnchor.constraint(equalToConstant: 0.75)
            heightLayoutConstraint?.isActive = true
        } else {
            // Fallback on earlier versions
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

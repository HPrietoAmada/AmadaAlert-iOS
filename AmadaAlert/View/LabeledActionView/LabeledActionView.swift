//
//  LabeledActionView.swift
//  AmadaAlert
//
//  Created by IT Support on 12/16/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit


protocol LabeledActionViewDelegate {
    func viewTapped(_ labaledActionView: LabeledActionView, tag: Int)
}

class LabeledActionView: UIView {

    var value: Int?

    private var heightLayoutConstraint: NSLayoutConstraint?

    var delegate: LabeledActionViewDelegate?

    var height: CGFloat = 100

    var text: String = "" {
        didSet {
            button.setTitle(text, for: .normal)
        }
    }

    /* View Components */
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font =  UIFont(name: "HelveticaNeue", size: 18)
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action: #selector(handleButtonClicked),
            for: .touchUpInside
        )
        return button
    }()

    let bottomBorder: Border = {
        return Border()
    }()

    init(_ label: String, tag:Int, placeholder: String = "") {
        super.init(frame: CGRect.zero)
        self.label.text = label
        self.button.setTitle(placeholder, for: .normal)
        self.tag = tag
        self.initialzeViews()
    }

    func initialzeViews() {
        translatesAutoresizingMaskIntoConstraints = false
        // Add Components to View
        self.addSubview(self.label)
        self.addSubview(self.button)
        self.addSubview(self.bottomBorder)

        // button Constraints
        button.topAnchor.constraint(equalTo: centerYAnchor, constant: -4).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // button.delegate = self

        bottomBorder.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true

        // Label Constraints
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -4).isActive = true

        heightLayoutConstraint = heightAnchor.constraint(equalToConstant: height)
        heightLayoutConstraint?.isActive = true

        self.display()
    }

    @objc func handleButtonClicked() {
        guard let delegate = delegate else {
            return
        }
        delegate.viewTapped(self, tag: tag)
    }

    func display(_ display: Bool = true) {
        self.alpha = display ? 1 : 0
        heightLayoutConstraint?.constant = display ? height : 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

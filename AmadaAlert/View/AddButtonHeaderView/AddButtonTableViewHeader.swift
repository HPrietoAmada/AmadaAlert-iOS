//
//  ButtonCollectionViewFooter.swift
//  AmadaAlert
//
//  Created by IT Support on 12/17/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

protocol AddButtonTableViewHeaderDelegate {
    func addButtonTableViewHeader(_ buttonCollectionView: AddButtonTableViewHeader, addResponseButtonClicked inputText: String)
    func addButtonTableViewHeader(_ buttonCollectionView: AddButtonTableViewHeader)
}

class AddButtonTableViewHeader: UITableViewHeaderFooterView {
    let BOUNDS: CGFloat = 30

    var delegate: AddButtonTableViewHeaderDelegate?

    var placeholder: String = "" {
        didSet {
            textfield.placeholder = placeholder
        }
    }

    var text: String = "" {
        didSet {
            textfield.text = text
        }
    }

    var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }

    var placeholderText: String = "" {
        didSet {
            textfield.placeholder = placeholderText
        }
    }

    /* View Components */
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .clear
        textfield.font = UIFont(name: "HelveticaNeue", size: 18)
        textfield.keyboardType = .default
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    lazy var button: Button = {
        let button = Button("Add Response +")
        button.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 16)!
        button.buttonColor = .clear
        button.borderColor = UIColor.MainColors.mainColor
        button.titleColor = UIColor.MainColors.mainColor
        button.height = 40
        button.width = 160
        button.borderWidth = 1.5
        button.cornerRadius = 20
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()

    let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.isTranslucent = true
        toolbar.barStyle = UIBarStyle.default
        toolbar.isUserInteractionEnabled = true
        toolbar.backgroundColor = UIColor.white
        toolbar.tintColor = UIColor.MainColors.lightColor
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    let toolbarSpace: UIBarButtonItem = {
        let barSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil
        )
        return barSpace
    }()

    lazy var toolbarDone: UIBarButtonItem = {
        let barDone = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.done,
            target: nil,
            action: #selector(done)
        )
        barDone.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 16)!],
            for: .normal
        )
        return barDone
    }()

    

    /* Constructor for View */
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }

    @objc func handleTap() {
        guard let delegate = delegate, let inputText = textfield.text else {
            return
        }
        delegate.addButtonTableViewHeader(self, addResponseButtonClicked: inputText)
    }

    @objc func done() {
        guard let delegate = delegate else {
            return
        }
        delegate.addButtonTableViewHeader(self)
    }

    func setup() {
        // Add Components to View
        addSubview(titleLabel)
        addSubview(textfield)
        addSubview(button)

        toolbar.items = [
            toolbarSpace,
            toolbarDone
        ]

        textfield.inputAccessoryView = toolbar

        translatesAutoresizingMaskIntoConstraints = false

        // Title Label Constraints
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: BOUNDS).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -BOUNDS).isActive = true

        textfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        textfield.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        textfield.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        textfield.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textfield.heightAnchor.constraint(equalToConstant: 60).isActive = true

        button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 10).isActive = true
        button.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleCellTapped))
        addGestureRecognizer(gesture)
    }

    @objc func handleCellTapped() {
        print("Header tapped")
        textfield.becomeFirstResponder()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

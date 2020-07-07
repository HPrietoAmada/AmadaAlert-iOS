//
//  LabeledTextInputView.swift
//  AmadaAlert
//
//  Created by IT Support on 12/14/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

protocol LabeledTextInputViewDelegate {
    func labeledTextInputView(_ labeledTextInputView: LabeledTextInputView, done tag: Int)
}

class LabeledTextInputView: UIView, UITextFieldDelegate {
    var value: Int?

    private var heightLayoutConstraint: NSLayoutConstraint?

    var delegate: LabeledTextInputViewDelegate?

    var height: CGFloat = 100

    var placeholder: String?

    /* View Components */
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        textView.backgroundColor = .clear
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 2.5
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.MainColors.lightGray.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    let bottomBorder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.isTranslucent = true
        toolbar.barStyle = UIBarStyle.default
        toolbar.isUserInteractionEnabled = true
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

    init(_ label: String, tag:Int) {
        super.init(frame: CGRect.zero)
        self.label.text = label
        self.tag = tag
        self.initialzeViews()

    }

    @objc func done() {
        guard let delegate = delegate else {
            return
        }
        delegate.labeledTextInputView(self, done: tag)
    }

    func initialzeViews() {
        translatesAutoresizingMaskIntoConstraints = false
        // Add Components to View
        self.addSubview(self.label)
        self.addSubview(self.textView)
        self.addSubview(self.bottomBorder)

        toolbar.items = [self.toolbarSpace, self.toolbarDone]

        textView.inputAccessoryView = self.toolbar

        label.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        // Field Constraints
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        textView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textView.delegate = self

        bottomBorder.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomBorder.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 0.75).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true

        heightLayoutConstraint = heightAnchor.constraint(equalToConstant: height)
        heightLayoutConstraint?.isActive = true

        display()
    }

    func display(_ display: Bool = true) {
        self.alpha = display ? 1 : 0
        heightLayoutConstraint?.constant = display ? height : 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

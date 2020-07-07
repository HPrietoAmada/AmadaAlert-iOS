//
//  TextInputViewController.swift
//  AmadaAlert
//
//  Created by HPrietoAmada on 2/27/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

class TextInputViewController: UIViewController {

    var titleText: String = "" {
        didSet {
            titleView.titleLabel.text = titleText
        }
    }

    var subtitleText: String = "" {
        didSet {
            titleView.subtitleLabel.text = subtitleText
        }
    }

    let titleView: TitleView = {
        return TitleView("", subtitle: "")
    }()

    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    let doneButton: Button = {
        return Button("Done")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if view.inDarkMode() {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setup() {
        view.addSubview(titleView)
        view.addSubview(textView)
        view.addSubview(doneButton)

        titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top + 50).isActive = true
        titleView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        textView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        textView.widthAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

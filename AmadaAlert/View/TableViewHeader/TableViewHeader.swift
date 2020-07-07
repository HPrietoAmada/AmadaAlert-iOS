//
//  TableViewHeader.swift
//  AmadaHRKiosk
//
//  Created by HPrietoAmada on 3/4/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

public class TableViewHeader: UITableViewHeaderFooterView {

    var _title: String = "" {
        didSet {
            titleTextView.text = _title
        }
    }

    var _subtitle: String = "" {
        didSet {
            subtitleTextView.text = _subtitle
        }
    }

    public var _backgroundColor: UIColor = UIColor.clear {
        didSet {
            backgroundColor = _backgroundColor
        }
    }

    public var _titleColor: UIColor = .black {
        didSet {
            titleTextView.textColor = _titleColor
        }
    }

    let titleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 32)
        textView.sizeToFit()
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textContainer.maximumNumberOfLines = 1
        textView.contentInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.sizeToFit()
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textContainer.maximumNumberOfLines = 2
        textView.contentInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }

    func setup() {
        addSubview(titleTextView)
        addSubview(subtitleTextView)

        if #available(iOS 9.0, *) {
            titleTextView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
            titleTextView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
            titleTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

            subtitleTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: -10).isActive = true
            subtitleTextView.widthAnchor.constraint(equalTo: titleTextView.widthAnchor).isActive = true
            subtitleTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            subtitleTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

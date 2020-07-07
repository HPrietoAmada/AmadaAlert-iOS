//
//  SettingsTableViewCell.swift
//  AmadaAlert
//
//  Created by HPrietoAmada on 3/2/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    var title: String = "" {
        didSet {
            textView.text = title
        }
    }

    var showRightArrow: Bool = true {
        didSet {
            accessoryType = .disclosureIndicator
        }
    }

    let textView: UITextView = {
        let textView = UITextView()
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    let border: Border = {
        return Border()
    }()

    func setup() {
        backgroundColor = .clear
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        addSubview(textView)
        addSubview(border)

        textView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

        border.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        border.leftAnchor.constraint(equalTo: textView.leftAnchor).isActive = true
        border.rightAnchor.constraint(equalTo: textView.rightAnchor).isActive = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

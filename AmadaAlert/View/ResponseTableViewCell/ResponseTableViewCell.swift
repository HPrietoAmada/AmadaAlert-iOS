//
//  ResponseTableViewCell.swift
//  AmadaAlert
//
//  Created by IT Support on 7/9/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

class ResponseTableViewCell: UITableViewCell {

    var hideBorder: Bool = false {
        didSet {
            border.backgroundColor = hideBorder ? .clear : .placeholder
        }
    }

    var topPadding: CGFloat = 10
    var bottomPadding: CGFloat = -10
    var leftPadding: CGFloat = 20
    var rightPadding: CGFloat = -20

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false

        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return label
    }()

    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.textColor = .gray
        textView.sizeToFit()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return label
    }()

    let border: Border = {
        let border = Border()
        return border
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func setup() {
        selectionStyle = .none
        addSubview(titleLabel)
        addSubview(descriptionTextView)
        addSubview(dateLabel)
        addSubview(border)

        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: leftPadding).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: rightPadding).isActive = true

        descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: dateLabel.topAnchor).isActive = true

        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomPadding).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        border.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        border.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        border.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AlertTableViewCell.swift
//  AmadaAlert
//
//  Created by IT Support on 7/19/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit
// import MapboxDirections
import MapKit

public class BasicTableViewCell: UITableViewCell {

    let topLeftLabel: TableCellTextView = {
        let textView = TableCellTextView()
        textView.text = "topLeft"
        textView.textAlignment = .left
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.backgroundColor = UIColor.clear
        return textView
    }()

    let topRightLabel: TableCellTextView = {
        let textView = TableCellTextView()
        textView.text = "topRight"
        textView.textAlignment = .right
        textView.textColor = UIColor.MainColors.lightColor
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        textView.backgroundColor = UIColor.clear
        return textView
    }()

    let descriptionLabel: TableCellTextView = {
        let textView = TableCellTextView()
        textView.text = "description"
        textView.textAlignment = .left
        textView.textColor = UIColor.gray
        textView.font = UIFont(name: "HelveticaNeue", size: 16)
        textView.backgroundColor = UIColor.clear
        return textView
    }()

    let bottomLeftLabel: TableCellTextView = {
        let textView = TableCellTextView()
        textView.text = "bottomLeft"
        textView.textAlignment = .left
        // label.textColor = .black
        textView.textColor = UIColor.lightGray
        textView.font = UIFont(name: "HelveticaNeue", size: 14)
        textView.backgroundColor = UIColor.clear
        return textView
    }()

    let bottomRightLabel: TableCellTextView = {
        let textView = TableCellTextView()
        textView.text = "bottomRight"
        textView.textAlignment = .right
        // label.textColor = .black
        textView.textColor = UIColor.lightGray
        textView.font = UIFont(name: "HelveticaNeue", size: 14)
        textView.backgroundColor = UIColor.clear
        return textView
    }()

    let bottomBorder: Border = {
        return Border()
    }()

    /* TableViewCell Constructor */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    /* Adds UIComponents to TableViewCell's View */
    func setup() {
        // Add views to Custom TableCellView
        self.selectionStyle = .none

        if #available(iOS 9.0, *) {
            backgroundColor = .clear
            addSubview(self.topLeftLabel)
            addSubview(self.topRightLabel)
            addSubview(self.bottomLeftLabel)
            addSubview(self.descriptionLabel)
            addSubview(self.bottomBorder)

            topLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
            topLeftLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
            topLeftLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true

            topRightLabel.leftAnchor.constraint(equalTo: centerXAnchor).isActive = true
            topRightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
            topRightLabel.topAnchor.constraint(equalTo: topLeftLabel.topAnchor).isActive = true

            descriptionLabel.topAnchor.constraint(equalTo: topLeftLabel.bottomAnchor, constant: -5).isActive = true
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomLeftLabel.topAnchor, constant: 5).isActive = true
            descriptionLabel.leftAnchor.constraint(equalTo: topLeftLabel.leftAnchor).isActive = true
            descriptionLabel.rightAnchor.constraint(equalTo: topRightLabel.rightAnchor).isActive = true

            bottomLeftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
            bottomLeftLabel.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor).isActive = true
            bottomLeftLabel.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor).isActive = true
            bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            bottomBorder.leftAnchor.constraint(equalTo: bottomLeftLabel.leftAnchor).isActive = true
                   bottomBorder.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

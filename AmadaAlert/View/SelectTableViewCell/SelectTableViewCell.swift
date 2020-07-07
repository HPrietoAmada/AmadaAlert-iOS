//
//  SelectCollectionView.swift
//  AmadaAlert
//
//  Created by IT Support on 12/17/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

protocol SelectTableViewCellDelegate {
    func selectTableViewCell(_ selectCollectionView: SelectTableViewCell, tableViewCellSelected indexPath: IndexPath, selectState: Bool)
}

class SelectTableViewCell: UITableViewCell {

    var delegate: SelectTableViewCellDelegate?

    let xMargin: CGFloat = 20

    var indexPath: IndexPath?

    var titleText: String = "" {
        didSet {
            textView.text = titleText
        }
    }

    var selectState: Bool = false {
        didSet {
            borderColor = selectState ? UIColor.MainColors.mainColor : UIColor.lightGray
            // textColor = selectState ? UIColor.MainColors.mainColor : UIColor.lightGray
        }
    }

    var titleTextColor: UIColor = UIColor.lightGray {
        didSet {
            textView.textColor = titleTextColor
        }
    }

    var borderColor: UIColor = UIColor.lightGray {
        didSet {
            textView.layer.borderColor = borderColor.cgColor
        }
    }

    var borderWidth: CGFloat = 1 {
        didSet {
            textView.layer.borderWidth = borderWidth
        }
    }

    let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "HelveticaNeue", size: 17)
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.textContainer.maximumNumberOfLines = 3
        textView.clipsToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }

    func setup() {
        addSubview(textView)
        selectionStyle = .none
        textView.layer.masksToBounds = true
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 4
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        textView.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap() {
        guard let delegate = delegate,
            let indexPath = indexPath else {
                return
        }

        delegate.selectTableViewCell(self, tableViewCellSelected: indexPath, selectState: selectState)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

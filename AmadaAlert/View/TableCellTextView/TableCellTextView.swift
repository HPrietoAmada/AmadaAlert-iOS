//
//  TableCellTextView.swift
//  AmadaAlert
//
//  Created by IT Support on 2/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

public class TableCellTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        isUserInteractionEnabled = false
        isScrollEnabled = false
        isEditable = false
        sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

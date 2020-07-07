//
//  BlankCollectionReuseCell.swift
//  AmadaAlert
//
//  Created by IT Support on 12/16/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

class BlankCollectionReuseCell: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

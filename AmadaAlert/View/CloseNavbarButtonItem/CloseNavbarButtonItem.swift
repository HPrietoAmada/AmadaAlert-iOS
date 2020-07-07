//
//  CloseNavbarButtonItem.swift
//  AmadaAlert
//
//  Created by IT Support on 12/14/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

class CloseNavbarButtonItem: UIBarButtonItem {

    override init() {
        super.init()
        setup()
    }

    private func setup() {
        let image = UIImage(named: "close")
        style = UIBarButtonItem.Style.plain
        self.image = image
        tintColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

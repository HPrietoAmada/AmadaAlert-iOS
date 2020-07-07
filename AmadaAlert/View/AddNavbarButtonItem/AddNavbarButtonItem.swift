//
//  AddNavbarButtonItem.swift
//  AmadaAlert
//
//  Created by IT Support on 7/18/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

class AddNavbarButtonItem: UIBarButtonItem {

    override init() {
        super.init()
        setup()
    }

    private func setup() {
        let image = UIImage(named: "add")
        style = UIBarButtonItem.Style.plain
        self.image = image
        tintColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

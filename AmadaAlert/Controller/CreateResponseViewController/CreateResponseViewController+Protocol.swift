//
//  CreateResponseViewController+Protocol.swift
//  AmadaAlert
//
//  Created by IT Support on 12/17/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

extension CreateResponseViewController: SelectTableViewCellDelegate, ButtonDelegate {

    func selectTableViewCell(_ selectCollectionView: SelectTableViewCell, tableViewCellSelected indexPath: IndexPath, selectState: Bool) {
    }

    func button(_ amadaButton: Button, buttonClicked tag: Int) {
        dismiss(animated: true, completion: nil)
    }
}

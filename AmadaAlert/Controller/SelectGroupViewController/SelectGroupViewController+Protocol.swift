//
//  SelectGroupViewController+Protocol.swift
//  AmadaAlert
//
//  Created by IT Support on 12/16/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

extension SelectGroupViewController: CheckboxCollectionCellDelegate, ButtonDelegate {

    func button(_ amadaButton: Button, buttonClicked tag: Int) {
        dismiss(animated: true, completion: nil)
    }


    func didCheck(_ checkboxCollectionCell: CheckboxCollectionCell, isChecked: Bool, indexPath: IndexPath) {
        let collectionViewCell = collectionView.cellForItem(at: indexPath) as! CheckboxCollectionCell
        SELECTED_GROUP_STATUS[indexPath.row] = collectionViewCell.isChecked
    }
}

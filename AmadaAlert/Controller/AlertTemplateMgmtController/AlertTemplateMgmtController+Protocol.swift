//
//  AlertTemplateMgmtController+Protocol.swift
//  AmadaAlert
//
//  Created by IT Support on 7/26/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension AlertTemplateMgmtController: LabeledActionViewDelegate, LabeledTextInputViewDelegate, CreateResponseViewControllerDelegate, SelectGroupViewControllerDelegate {

    func done(_ selectGroupViewController: SelectGroupViewController, group: [WebITUsersOffices]) {
        let nGroups = group.count
        switch nGroups {
        case 0:
            break
        case 1:
            selectGroupActionView.text = "\(group[0].OFFICE_TITLE ?? "")"
            break
        default:
            selectGroupActionView.text = "\(group[0].OFFICE_TITLE ?? ""), +\(nGroups - 1) more"
            break
        }
        selectGroup = group
        selectGroupViewController.dismiss(animated: true, completion: nil)
    }

    func createResponseViewControllerDone(_ createResponseViewController: CreateResponseViewController, created responses: [AlertResponse]) {
        self.alertTemplateResponses = responses
        // createResponseViewController.dismiss(animated: true, completion: nil)
    }

    func labeledTextInputView(_ labeledTextInputView: LabeledTextInputView, done tag: Int) {
        switch tag {
        case 1: // Message inputView
            view.endEditing(true)
            break
        default:
            break
        }
    }

    func viewTapped(_ labaledActionView: LabeledActionView, tag: Int) {
        switch tag {
        case 1: // Select Group
            selectingGroup()
            break
        case 2: // Create Response Options
            createResponse()
            break
        default:
            break
        }
    }

    private func createResponse() {
        let createResponseViewController = CreateResponseViewController()
        createResponseViewController.delegate = self
        createResponseViewController.models = alertTemplateResponses
        let navigationController = NavigationController(rootViewController: createResponseViewController)
        present(navigationController, animated: true, completion: nil)
    }

    private func selectingGroup() {
        let selectGroupViewController = SelectGroupViewController()
        selectGroupViewController.delegate = self
        let navigationController = NavigationController(rootViewController: selectGroupViewController)
        present(navigationController, animated: true, completion: nil)
    }
}

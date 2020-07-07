//
//  CreateAlertViewController+Protocol.swift
//  AmadaAlert
//
//  Created by IT Support on 12/16/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

extension CreateAlertViewController: LabeledActionViewDelegate, LabeledTextInputViewDelegate, CreateResponseViewControllerDelegate, SelectGroupViewControllerDelegate {

    @objc func handleSendNow() {
        createAlert { (alert, message) in
            guard let alert = alert else {
                self.presentAlert(title: "Error", message: message)
                return
            }
            DBManager.shared.create(alert) { (res, err) in
                if let err = err {
                    self.presentAlert(title: "Error", message: err.localizedDescription)
                    return
                }
                guard let res = res, let newAlertId: Int = res.insertId else { return }
                let newAlertIdNotCreated: Bool = newAlertId == 0
                if newAlertIdNotCreated { return }
                var newAlertResponseArr = [AlertResponse]()
                self.alertResponseList.forEach { (alertResponse) in
                    var newAlertResponse = AlertResponse()
                    newAlertResponse.alertId = newAlertId
                    newAlertResponse.responseDesc = alertResponse.responseDesc
                    newAlertResponse.createdId = 567
                    newAlertResponse.createdDate = Date().toJson()
                    newAlertResponse.updatedId = 567
                    newAlertResponse.updatedDate = Date().toJson()
                    newAlertResponseArr.append(newAlertResponse)
                }
                DBManager.shared.create(newAlertResponseArr) { (alertCreateRes, er) in
                    if let er = er {
                        self.presentAlert(title: "Error", message: er.localizedDescription)
                        return
                    }
                    
                }
            }
        }
    }

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
        self.alertResponseList = responses
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
        //createResponseViewController.models = alertResponses
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

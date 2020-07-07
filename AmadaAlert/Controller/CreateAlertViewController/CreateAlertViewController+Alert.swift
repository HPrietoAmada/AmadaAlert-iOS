//
//  CreateAlertViewController+Alert.swift
//  AmadaAlert
//
//  Created by IT Support on 7/29/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension CreateAlertViewController {
    func createAlert(_ completionHandler: (Alert?, String) -> Void) {
        let byText = textCheckboxView.isChecked ? 1 : 0
        let byEmail = emailCheckboxView.isChecked ? 1 : 0
        let byPush = pushCheckboxView.isChecked ? 1 : 0
        let noneSelected = byText == 0 && byEmail == 0 && byPush == 0
        let message = messageInputView.textView.text
        let messageIsBlank = message?.count == 0
        let groupsNotSelected = selectGroup.count == 0
        let nRetries = Int(retriesTextField.field.text ?? "0")
        let retryDelay = Int(retryDelayTextField.field.text ?? "0")
        let allowResponseChange = allowResponseChangeCheckboxView.isChecked ? 1 : 0
        let responsesNotCreated = self.alertResponseList.count == 0

        if messageIsBlank {
            completionHandler(nil, "No message has been entered.")
            return
        }

        if noneSelected == false {
            //completionHandler(nil, "No send type has been chosen.")
            //return
        }

        if groupsNotSelected {
            //completionHandler(nil, "No select groups have been chosen.")
            //return
        }

        if responsesNotCreated {
            completionHandler(nil, "No responses created")
            return
        }

        var alert = Alert()
        alert.byText = byText
        alert.byEmail = byEmail
        alert.byPush = byPush
        alert.nRetries = nRetries
        alert.retryDelay = retryDelay
        alert.retryCount = 5
        alert.message = message
        alert.allowResponseChange = allowResponseChange
        alert.sendDate = Date()
        alert.createdId = 567
        alert.createdDate = Date()
        alert.updatedId = 567
        alert.updatedDate = Date()


        completionHandler(alert, "Success")
    }
}

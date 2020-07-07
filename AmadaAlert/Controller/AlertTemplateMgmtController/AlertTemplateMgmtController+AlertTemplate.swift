//
//  AlertTemplateMgmtController+AlertTemplate.swift
//  AmadaAlert
//
//  Created by IT Support on 7/29/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension AlertTemplateMgmtController {
    func createAlertTemplate(_ completionHandler: (AlertTemplate?, String) -> Void) {
        let templateName = templateNameTextField.field.text
        let templateNameIsBlank = templateName?.count == 0
        let textSelected = textCheckboxView.isChecked
        let emailSelected = emailCheckboxView.isChecked
        let pushSelected = pushCheckboxView.isChecked
        let noSendTypeSelected = !textSelected && !emailSelected && !pushSelected
        let message = messageInputView.textView.text
        let messageIsBlank = message?.count == 0
        let groupsNotSelected = selectGroup.count == 0
        let nRetries = Int(retriesTextField.field.text ?? "0")
        let retryDelay = Int(retryDelayTextField.field.text ?? "0")
        let allowResponseChange = allowResponseChangeCheckboxView.isChecked
        let nResponses = alertTemplateResponses.count

        if nResponses == 0 {
            completionHandler(nil, "Please select possible responses")
            return
        }

        if noSendTypeSelected {
            completionHandler(nil, "Please select how you would like to send this message")
            return
        }

        if templateNameIsBlank {
            completionHandler(nil, "No template name has been entered")
            return
        }

        if messageIsBlank {
            completionHandler(nil, "No template message has been entered")
            return
        }

        if groupsNotSelected {
            //completionHandler(nil, "No select groups have been chosen.")
            //return
        }

        var alertTemplate = AlertTemplate()
        alertTemplate.templateName = templateName
        alertTemplate.notificationType = 0
        alertTemplate.byEmail = emailSelected ? 1 : 0
        alertTemplate.byText = textSelected ? 1 : 0
        alertTemplate.byPush = pushSelected ? 1 : 0
        alertTemplate.nRetries = nRetries
        alertTemplate.retryDelay = retryDelay
        alertTemplate.message = message
        alertTemplate.allowResponseChange = allowResponseChange ? 1 : 0
        alertTemplate.status = 0
        alertTemplate.createdId = 567
        alertTemplate.createdDate = Date()
        alertTemplate.updatedId = 567
        alertTemplate.updatedDate = Date()

        completionHandler(alertTemplate, "Success")
    }
}

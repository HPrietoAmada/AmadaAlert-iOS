//
//  CreateAlertViewController.swift
//  AmadaAlert
//
//  Created by IT Support on 12/14/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

class CreateAlertViewController: UIViewController {

    var alert: Alert? {
        didSet {
            guard let alert = alert else { return }
            if let _ = alert.notificationType {

            }

            if let byEmail = alert.byEmail {
                emailCheckboxView.isChecked = byEmail == 1
            }

            if let byText = alert.byText {
                textCheckboxView.isChecked = byText == 1
            }

            if let byPush = alert.byPush {
                pushCheckboxView.isChecked = byPush == 1
            }

            if let nRetries = alert.nRetries {
                retriesTextField.text = "\(nRetries)"
            }

            if let retryDelay = alert.retryDelay {
                retryDelayTextField.text = "\(retryDelay)"
            }

            if let message = alert.message {
                messageInputView.textView.text = message
            }

            if let allowResponseChange = alert.allowResponseChange {
                allowResponseChangeCheckboxView.isChecked = allowResponseChange == 1
            }
        }
    }

    var alertResponseList: [AlertResponse] = [AlertResponse]() {
        didSet {
            let nResponses = alertResponseList.count
            createResponseActionView.text = "\(nResponses) response(s)"
        }
    }

    var selectGroup: [WebITUsersOffices] = [WebITUsersOffices]()

    var showCloseButton: Bool = false {
        didSet {
            if showCloseButton {
                navigationItem.leftBarButtonItem = navbarClose
            }
        }
    }

    let titleView: TitleView = {
        let titleView = TitleView("New Alert", subtitle: "")
        return titleView
    }()

    let scrollView: ScrollView = {
        let scrollView = ScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    let templatePickerView: LabeledPickerView = {
        let labeledPickerView = LabeledPickerView(text: "Alert Template", models: [])
        //labeledPickerView.toolbarDoneButton.action = #selector(endEditing)
        return labeledPickerView
    }()

    let notificationTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "How would you like to send this alert?"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let emailCheckboxView: CheckboxView = {
        let checkboxView = CheckboxView("Send by email")
        checkboxView.titleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        checkboxView.isChecked = true
        return checkboxView
    }()

    let textCheckboxView: CheckboxView = {
        let checkboxView = CheckboxView("Send by text")
        checkboxView.titleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        checkboxView.isChecked = false
        return checkboxView
    }()

    let pushCheckboxView: CheckboxView = {
        let checkboxView = CheckboxView("Send push notification")
        checkboxView.titleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        checkboxView.isChecked = false
        return checkboxView
    }()

    let pushNotificationButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Push Notification"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let retriesTextField: LabeledTextField = {
        let labeledTextField = LabeledTextField(
            "Retries",
            tag: 1,
            placeholder: "How many times would you like to resend?"
        )
        labeledTextField.field.keyboardType = .numberPad
        return labeledTextField
    }()

    let retryDelayTextField: LabeledTextField = {
        let labeledTextField = LabeledTextField(
            "Retry Delay (seconds)",
            tag: 2,
            placeholder: "How frequently would you like to resend?"
        )
        labeledTextField.field.keyboardType = .numberPad
        return labeledTextField
    }()

    let messageInputView: LabeledTextInputView = {
        let labeledTextInputView = LabeledTextInputView(
            "Message",
            tag: 1
        )
        return labeledTextInputView
    }()

    let selectGroupActionView: LabeledActionView = {
        let labeledActionView = LabeledActionView(
            "Send Group",
            tag: 1,
            placeholder: "Who should receive this message?"
        )
        return labeledActionView
    }()

    let createResponseActionView: LabeledActionView = {
        let labeledActionView = LabeledActionView(
            "Responses",
            tag: 2,
            placeholder: "What should they respond?"
        )
        return labeledActionView
    }()

    let allowResponseChangeCheckboxView: CheckboxView = {
        let checkboxView = CheckboxView("Allow recipients to change their response?")
        checkboxView.titleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        checkboxView.isChecked = true
        return checkboxView
    }()

    lazy var sendNowButton: Button = {
        let button = Button("Create Alert")
        button.height = 60
        button.tag = 4
        button.addTarget(
            self,
            action: #selector(handleSendNow),
            for: .touchUpInside
        )
        return button
    }()

    lazy var navbarClose: CloseNavbarButtonItem = {
        let navbarClose = CloseNavbarButtonItem()
        navbarClose.target = self
        navbarClose.action = #selector(close)
        return navbarClose
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if view.inDarkMode() {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

    @objc func endEditing() {
        view.endEditing(true)
    }
     
}

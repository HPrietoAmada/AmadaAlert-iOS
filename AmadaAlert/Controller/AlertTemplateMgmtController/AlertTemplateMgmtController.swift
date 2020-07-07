//
//  AlertTemplateMgmtController.swift
//  AmadaAlert
//
//  Created by IT Support on 7/26/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

class AlertTemplateMgmtController: UIViewController {

    var selectGroup: [WebITUsersOffices] = [WebITUsersOffices]()
    var alertTemplateResponses: [AlertResponse] = [AlertResponse]() {
        didSet {
            let nResponses = alertTemplateResponses.count
            createResponseActionView.text = "\(nResponses) response(s) added"
        }
    }

    var model: AlertTemplate? {
        didSet {
            if let _ = model {
            }
        }
    }

    let titleView: TitleView = {
        let titleView = TitleView("Alert Template Mgmt",
                                  subtitle: "")
        return titleView
    }()

    let scrollView: ScrollView = {
        let scrollView = ScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    let templateNameTextField: LabeledTextField = {
        let labeledTextField = LabeledTextField(
            "Template Name",
            tag: 1,
            placeholder: "What would you like to name this template?"
        )
        return labeledTextField
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
            placeholder: "How should they respond?"
        )
        return labeledActionView
    }()

    let allowResponseChangeCheckboxView: CheckboxView = {
        let checkboxView = CheckboxView("Allow recipients to change their response?")
        checkboxView.titleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        checkboxView.isChecked = true
        return checkboxView
    }()

    lazy var createTemplateButton: Button = {
        let button = Button("Create Template")
        button.height = 60
        button.tag = 4
        button.addTarget(
            self,
            action: #selector(handleCreateTemplate),
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupScrollView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        templateNameTextField.becomeFirstResponder()
    }

    func setup() {
        if view.inDarkMode() {
            navbarClose.tintColor = .white
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
            navbarClose.tintColor = .black
        }
        //navigationItem.leftBarButtonItem = navbarClose
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

    @objc func handleCreateTemplate() {
        createAlertTemplate { (alertTemplate, message) in
            guard let alertTemplate = alertTemplate else {
                self.presentAlert(title: "Error", message: message)
                return
            }
            DBManager.shared.create(alertTemplate) { (response, error) in
                if let error = error {
                    self.presentAlert(title: "Error", message: error.localizedDescription)
                    return
                }
                guard let res = response, let insertId: Int = res.insertId else { return }
                let newAlertIdNotCreated: Bool = insertId == 0
                if newAlertIdNotCreated { return }
                var alertTemplateResponseList: [AlertTemplateResponse] = []
                self.alertTemplateResponses.forEach { (alertResponse) in
                    var newAlertTemplateResponse = AlertTemplateResponse()
                    newAlertTemplateResponse.templateAlertId = insertId
                    newAlertTemplateResponse.responseDesc = alertResponse.responseDesc
                    newAlertTemplateResponse.createdId = 567
                    newAlertTemplateResponse.updatedId = 567
                    alertTemplateResponseList.append(newAlertTemplateResponse)
                }
                DBManager.shared.create(alertTemplateResponseList) { (responseList, err) in
                    if let err = err {
                        self.presentAlert(title: "Error", message: err.localizedDescription)
                        return
                    }
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}


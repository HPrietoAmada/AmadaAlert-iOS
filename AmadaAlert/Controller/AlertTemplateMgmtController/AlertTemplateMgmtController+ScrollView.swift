//
//  AlertTemplateMgmtController+ScrollView.swift
//  AmadaAlert
//
//  Created by IT Support on 7/26/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension AlertTemplateMgmtController: UIScrollViewDelegate {

    func setupScrollView() {
        let viewWidth = view.bounds.width - 40

        view.addSubview(scrollView)

        scrollView.delegate = self
        scrollView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.contentSize = CGSize(width: viewWidth, height: 1500)

        scrollView.addSubview(titleView)
        scrollView.addSubview(templateNameTextField)
        scrollView.addSubview(notificationTypeLabel)
        scrollView.addSubview(textCheckboxView)
        scrollView.addSubview(emailCheckboxView)
        scrollView.addSubview(pushCheckboxView)
        scrollView.addSubview(retriesTextField)
        scrollView.addSubview(retryDelayTextField)
        scrollView.addSubview(messageInputView)
        scrollView.addSubview(selectGroupActionView)
        scrollView.addSubview(createResponseActionView)
        scrollView.addSubview(allowResponseChangeCheckboxView)
        scrollView.addSubview(createTemplateButton)

        titleView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        titleView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        templateNameTextField.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 30).isActive = true
        templateNameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        templateNameTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        notificationTypeLabel.topAnchor.constraint(equalTo: templateNameTextField.bottomAnchor, constant: 20).isActive = true
        notificationTypeLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        notificationTypeLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        // text, email, push checkbox view
        emailCheckboxView.topAnchor.constraint(equalTo: notificationTypeLabel.bottomAnchor).isActive = true
        emailCheckboxView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        emailCheckboxView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        textCheckboxView.topAnchor.constraint(equalTo: emailCheckboxView.bottomAnchor).isActive = true
        textCheckboxView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        textCheckboxView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        pushCheckboxView.topAnchor.constraint(equalTo: textCheckboxView.bottomAnchor).isActive = true
        pushCheckboxView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        pushCheckboxView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        retriesTextField.topAnchor.constraint(equalTo: pushCheckboxView.bottomAnchor).isActive = true
        retriesTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        retriesTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        retryDelayTextField.topAnchor.constraint(equalTo: retriesTextField.bottomAnchor, constant: 10).isActive = true
        retryDelayTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        retryDelayTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        messageInputView.delegate = self
        messageInputView.topAnchor.constraint(equalTo: retryDelayTextField.bottomAnchor, constant: 10).isActive = true
        messageInputView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        messageInputView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        selectGroupActionView.delegate = self
        selectGroupActionView.topAnchor.constraint(equalTo: messageInputView.bottomAnchor).isActive = true
        selectGroupActionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        selectGroupActionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        createResponseActionView.delegate = self
        createResponseActionView.topAnchor.constraint(equalTo: selectGroupActionView.bottomAnchor).isActive = true
        createResponseActionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        createResponseActionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        allowResponseChangeCheckboxView.topAnchor.constraint(equalTo: createResponseActionView.bottomAnchor).isActive = true
        allowResponseChangeCheckboxView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        allowResponseChangeCheckboxView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        createTemplateButton.topAnchor.constraint(equalTo: allowResponseChangeCheckboxView.bottomAnchor, constant: 30).isActive = true
        createTemplateButton.width = viewWidth
        createTemplateButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
}

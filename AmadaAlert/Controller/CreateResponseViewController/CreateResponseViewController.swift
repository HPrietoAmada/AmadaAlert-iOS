//
//  CreateResponseViewController.swift
//  AmadaAlert
//
//  Created by IT Support on 12/17/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

protocol CreateResponseViewControllerDelegate {
    func createResponseViewControllerDone(_ createResponseViewController: CreateResponseViewController, created alertResponseList: [AlertResponse])
}

class CreateResponseViewController: UIViewController {

    let headerId = "HEADER"
    let cellId = "RESPONSE"
    let footerId = "FOOTER"

    var models = [AlertResponse]() {
        didSet {
            tableView.reloadData()
        }
    }

    var delegate: CreateResponseViewControllerDelegate?
    var buttonBottomLayoutConstraint: NSLayoutConstraint?

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Alert Response Mgmt"
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .clear
        textfield.font = UIFont(name: "HelveticaNeue", size: 18)
        textfield.placeholder = "Enter a response the user can select"
        textfield.keyboardType = .default
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.isTranslucent = true
        toolbar.barStyle = UIBarStyle.default
        toolbar.isUserInteractionEnabled = true
        //toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    let toolbarSpace: UIBarButtonItem = {
        let barSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil
        )
        return barSpace
    }()

    lazy var toolbarDone: UIBarButtonItem = {
        let barDone = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.done,
            target: nil,
            action: #selector(handleToolbarDone)
        )
        barDone.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 16)!],
            for: .normal
        )
        return barDone
    }()

    lazy var addResponseButton: Button = {
        let button = Button("Add Response +")
        button.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 16)!
        button.buttonColor = .clear
        button.borderColor = UIColor.MainColors.mainColor
        button.titleColor = UIColor.MainColors.mainColor
        button.height = 40
        button.width = 160
        button.borderWidth = 1.5
        button.cornerRadius = 20
        button.addTarget(
            self,
            action: #selector(handleAddResponseButtonClicked),
            for: .touchUpInside
        )
        return button
    }()

    @objc func handleAddResponseButtonClicked() {
        guard let newResponseText = textfield.text else { return }
        if newResponseText.count < 1 { return }
        var newResponse = AlertResponse()
        newResponse.responseDesc = newResponseText
        models.append(newResponse)
        textfield.text = ""
    }

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var closeNavigationItem: CloseNavbarButtonItem = {
        let closeNavbarButtonItem = CloseNavbarButtonItem()
        closeNavbarButtonItem.action = #selector(close)
        closeNavbarButtonItem.target = self
        return closeNavbarButtonItem
    }()

    lazy var doneButton: Button = {
        let button = Button()
        button.title = "Done"
        button.width = 90
        button.height = 50
        button.fontSize = 18
        button.addTarget(self, action: #selector(done), for: .touchUpInside)
        return button
    }()

    @objc func done() {
        guard let delegate = delegate else {
            return
        }
        dismiss(animated: true, completion: nil)
        delegate.createResponseViewControllerDone(self, created: models)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if view.inDarkMode() {
            closeNavigationItem.tintColor = .white
        } else {
            closeNavigationItem.tintColor = .black
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardShow(_ sender: Notification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            guard let buttonBottomConst = buttonBottomLayoutConstraint else {
                return
            }

            buttonBottomConst.constant = -(keyboardHeight + 5)
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardHide(_ sender: Notification) {
        if let _ = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            guard let buttonBottomConst = buttonBottomLayoutConstraint else {
                return
            }

            buttonBottomConst.constant = -20

            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textfield.becomeFirstResponder()
    }

    func setup() {
        view.backgroundColor = view.inDarkMode() ? .black : .white
        navigationItem.leftBarButtonItem = closeNavigationItem

        view.addSubview(titleLabel)
        view.addSubview(textfield)
        view.addSubview(addResponseButton)
        view.addSubview(tableView)
        view.addSubview(doneButton)

        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top + 40).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        textfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        textfield.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
        toolbar.items = [
            toolbarSpace,
            toolbarDone
        ]
        textfield.inputAccessoryView = toolbar

        addResponseButton.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 10).isActive = true
        addResponseButton.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SelectTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.topAnchor.constraint(equalTo: addResponseButton.bottomAnchor, constant: 20).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        buttonBottomLayoutConstraint = doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        buttonBottomLayoutConstraint?.isActive = true
        doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
    }

    @objc func handleToolbarDone() {
        view.endEditing(true)
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
}

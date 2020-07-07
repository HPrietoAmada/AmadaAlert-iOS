//
//  SettingsViewController.swift
//  AmadaAlert
//
//  Created by HPrietoAmada on 3/2/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsViewController(_ controller: SettingsViewController, itemSelected indexPath: IndexPath, tag: Int)
}

class SettingsViewController: UIViewController {

    var delegate: SettingsViewControllerDelegate?

    let cellId: String = "settings-cell-id"
    let headerId: String = "settings-header-id"

    var tag: Int = 0

    var headerTitle: String = ""
    var headerSubtitle: String = ""

    var showCloseButton: Bool = false {
        didSet {
            navigationItem.leftBarButtonItem = navbarClose
        }
    }

    var models: [String] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    let tableView: TableView = {
        let tableView = TableView()
        return tableView
    }()

    lazy var navbarClose: CloseNavbarButtonItem = {
        let navbarClose = CloseNavbarButtonItem()
        navbarClose.target = self
        navbarClose.action = #selector(close)
        return navbarClose
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setup() {
        if isDarkMode() {
            view.backgroundColor = .black
            navbarClose.tintColor = .white
        } else {
            view.backgroundColor = .white
            navbarClose.tintColor = .black
        }

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
}

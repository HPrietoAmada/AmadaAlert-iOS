//
//  AlertTableViewController.swift
//  AmadaAlert
//
//  Created by IT Support on 7/10/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

class AlertTableViewController: UIViewController {

    let cellId: String = "alerts-table-cell"
    let headerId: String = "alerts-table-header-cell"

    var models = [Alert]() {
        didSet {
            tableView.reloadData()
        }
    }

    let tableView: TableView = {
        let tableView = TableView()
        return tableView
    }()

    lazy var addNavbarItem: AddNavbarButtonItem = {
        let navbarItem = AddNavbarButtonItem()
        navbarItem.action = #selector(createAlert)
        navbarItem.target = self
        return navbarItem
    }()

    lazy var settingsNavbarItem: UIBarButtonItem = {
        let cogImage: UIImage = UIImage(named: "cog")!
        let barButton = UIBarButtonItem(
            image: cogImage,
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(handleDisplaySettings)
        )
        return barButton
    }()

    @objc func handleDisplaySettings() {
        let settingsViewController = SettingsViewController()
        settingsViewController.headerTitle = "Settings"
        settingsViewController.headerSubtitle = "Heriberto Prieto"
        settingsViewController.delegate = self
        settingsViewController.tag = 1
        settingsViewController.showCloseButton = true
        settingsViewController.models = [
            "Create New Alert",
            "Update Alert",
            "Create New Alert Template",
            "Update Alert Template",
            "Create Notification Type",
            "Log out"
        ]
        present(NavigationController(rootViewController: settingsViewController),
                animated: true,
                completion: nil
        )
    }

    @objc func createAlert() {
        let controller = CreateAlertViewController()
        controller.showCloseButton = true
        let navController = NavigationController(rootViewController: controller)
        present(navController, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isDarkMode() {
            view.backgroundColor = .black
            addNavbarItem.tintColor = .white
            settingsNavbarItem.tintColor = .white
        } else {
            view.backgroundColor = .white
            addNavbarItem.tintColor = .black
            settingsNavbarItem.tintColor = .black
        }

        fetchAlerts()
    }

    func fetchAlerts() {
        DBManager.shared.getAll { (alerts: [Alert], error) in
            if let err = error {
                print("Alerts Error: \(err.localizedDescription)")
                return
            }
            print("Alerts retreived: \(alerts.count)")
            self.models = alerts
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
    }

    func setup() {
        navigationItem.leftBarButtonItem = addNavbarItem
        navigationItem.rightBarButtonItem = settingsNavbarItem
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

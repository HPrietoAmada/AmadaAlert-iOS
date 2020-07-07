//
//  AlertTableViewController+Protocol.swift
//  AmadaAlert
//
//  Created by HPrietoAmada on 2/12/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension AlertTableViewController: SettingsViewControllerDelegate {
    func settingsViewController(_ controller: SettingsViewController, itemSelected indexPath: IndexPath, tag: Int) {
        print("settings tag: \(tag)")
        switch tag {
        case 1:// Main SettingsViewController
            handleSettingsCellActions(controller: controller, indexPath: indexPath)
            break
        case 2:// Alert Update Settings
            let alertController = CreateAlertViewController()
            alertController.titleView.titleLabel.text = "Alert Mgmt"
            alertController.alert = models[indexPath.row]
            controller.navigationController?.pushViewController(alertController, animated: true)
            break
        case 3:// Alert Template Update Settings
            controller.navigationController?.pushViewController(AlertTemplateMgmtController(), animated: true)
            break
        default:
            break
        }
    }

    func handleSettingsCellActions(controller: SettingsViewController, indexPath: IndexPath) {
        switch indexPath.row {
        case 0:// Create New Alert
            let createAlertController = CreateAlertViewController()
            controller.navigationController?.pushViewController(createAlertController, animated: true)
            break
        case 1:// Update Alert
            let alertSettingsController = SettingsViewController()
            alertSettingsController.headerTitle = "Alerts"
            alertSettingsController.headerSubtitle = "Which alert would you like to update?"
            alertSettingsController.tag = 2
            alertSettingsController.delegate = self
            var alerts: [String] = [String]()
            models.forEach { (alert) in
                if let message = alert.message {
                    alerts.append(message)
                }
            }
            alertSettingsController.models = alerts
            controller.navigationController?.pushViewController(alertSettingsController, animated: true)
            break
        case 2:// Create New Alert template
            controller.navigationController?.pushViewController(
                AlertTemplateMgmtController(),
                animated: true
            )
            break
        case 3:// Update Alert Teamplate
            DBManager.shared.getAll { (models: [AlertTemplate], err) in
                if let err = err {
                    print("Alert Template: \(err.localizedDescription)")
                    return
                }
                let alertTemplateSettingsController = SettingsViewController()
                alertTemplateSettingsController.headerTitle = "Alert Templates"
                alertTemplateSettingsController.headerSubtitle = "Which template would you like to update?"
                alertTemplateSettingsController.tag = 3
                alertTemplateSettingsController.delegate = self
                var alertTemplates: [String] = [String]()
                models.forEach { (alertTemplate) in
                    if let templateName = alertTemplate.templateName {
                        alertTemplates.append(templateName)
                    }
                }
                controller.navigationController?.pushViewController(alertTemplateSettingsController, animated: true)
            }
            break
        case 4:// Create Notification Type
            controller.navigationController?.pushViewController(
                AlertNotificationTypeMgmtViewController(),
                animated: true
            )
            break
        case 5:// Logout
            let alertController = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Log Out", style: .default, handler: { (action) in
                alertController.dismiss(animated: true, completion: nil)
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            controller.present(alertController, animated: true, completion: nil)
            break
        default:
            break
        }
    }

}

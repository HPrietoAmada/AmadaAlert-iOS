//
//  SettingsViewController+TableView.swift
//  AmadaAlert
//
//  Created by HPrietoAmada on 3/2/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsTableViewCell
        cell.title = models[indexPath.row]
        if indexPath.row == models.count - 1 {
            cell.accessoryType = .none
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! HeaderTableViewCell
        header.titleText = headerTitle
        header.subtitleText = headerSubtitle
        return header
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }
        delegate.settingsViewController(self, itemSelected: indexPath, tag: tag)
    }

}

//
//  AlertTableViewController+TableView.swift
//  AmadaAlert
//
//  Created by IT Support on 7/10/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension AlertTableViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: headerId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BasicTableViewCell
        let alert = models[indexPath.row]
        cell.alert = alert
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! HeaderTableViewCell
        header.titleText = "Alerts"
        header.subtitleText = "\(models.count) results found"
        return header
    }
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! HeaderTableViewCell
        let titleHeight = header.titleTextView.sizeThatFits(header.titleTextView.frame.size)
        let subtitleHeight = header.subtitleTextView.sizeThatFits(header.subtitleTextView.frame.size)
        return titleHeight.height + subtitleHeight.height
    }*/

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt: \(indexPath.row)")
        let controller = AlertStatsViewController()
        navigationController?.pushViewController(controller, animated: true)

    }
}

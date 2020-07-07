//
//  AlertViewController+CollectionView.swift
//  AmadaAlert
//
//  Created by IT Support on 7/9/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension AlertStatsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ResponseTableViewCell
        cell.titleLabel.text = "Heriberto Prieto"
        cell.dateLabel.text = "May 13, 2016"
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! HeaderTableViewCell
        let response = RESPONSES[section].responseDesc ?? ""
        header.subtitleText = "\(RESPONSES.count) result(s) found"
        header.titleTextView.backgroundColor = colors[section]
        header.subtitleTextView.backgroundColor = colors[section]
        header.titleTextView.font = UIFont(name: "HelveticaNeue", size: 18)
        header.subtitleTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        header.titleTextView.textColor = .white
        header.subtitleTextView.textColor = .white
        header.titleText = response
        return header
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return responseTypes.count
    }


    func setupTableView() {
        responseTableView.delegate = self
        responseTableView.dataSource = self
        responseTableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: headerID)
        responseTableView.register(ResponseTableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

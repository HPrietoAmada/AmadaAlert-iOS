//
//  CreateResponseViewController+TableView.swift
//  AmadaAlert
//
//  Created by IT Support on 2/10/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension CreateResponseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SelectTableViewCell
        let model = models[indexPath.row]
        cell.titleText = model.responseDesc ?? ""
        cell.selectState = true
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}

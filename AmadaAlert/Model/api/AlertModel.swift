//
//  AlertModel.swift
//  AmadaAlert
//
//  Created by IT Support on 7/29/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct AlertModel: Codable {
    public var AlertDetail: Alert?
    public var AlertResponses: [AlertResponse]?
    public var AlertGroups: [AlertUser]?
    init() {
        AlertDetail = Alert()
        AlertResponses = [AlertResponse]()
        AlertGroups = [AlertUser]()
    }
}

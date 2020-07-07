//
//  AlertRetryLog.swift
//  AmadaAlert
//
//  Created by IT Support on 7/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

struct AlertRetryLog: Codable {

    public var id: Int?
    public var alertId: Int?
    public var userCount: Int?
    public var retryCount: Int?
    public var retryDate: Date?

    init() {
        id = 0
        alertId = 0
        userCount = 0
        retryCount = 0
        retryDate = Date()
    }

    enum CodingKeys: String, CodingKey {
        case id
        case alertId = "alert_id"
        case userCount = "user_count"
        case retryCount = "retry_count"
        case retryDate = "retry_date"
    }
}

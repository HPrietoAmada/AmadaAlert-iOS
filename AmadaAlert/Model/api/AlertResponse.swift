//
//  AlertResponse.swift
//  AmadaAlert
//
//  Created by IT Support on 7/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

struct AlertResponse: Codable {

    public var id: Int?
    public var alertId: Int?
    public var responseDesc: String?
    public var sortOrder: Int?
    public var createdDate: String?
    public var createdId: Int?
    public var updatedDate: String?
    public var updatedId: Int?

    init() {
        id = 0
        alertId = 0
        responseDesc = ""
        sortOrder = 0
        createdDate = Date().toJson()
        createdId = 0
        updatedDate = Date().toJson()
        updatedId = 0
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case alertId = "alert_id"
        case responseDesc = "response_desc"
        case sortOrder = "sort_order"
        case createdDate = "created_date"
        case createdId = "created_id"
        case updatedDate = "updated_date"
        case updatedId = "updated_id"
    }

}

//
//  AlertUser.swift
//  AmadaAlert
//
//  Created by IT Support on 7/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct AlertUser: Codable {

    public var id: Int?
    public var userId: Int?
    public var alertId: Int?
    public var alertResponseId: Int?
    public var responseStatus: Int?
    public var respondedDate: Date?
    public var respondedId: Int?
    public var createdDate: Date?
    public var createdId: Int?
    public var updatedDate: Date?
    public var updatedId: Int?

    init() {
        id = 0
        userId = 0
        alertId = 0
        alertResponseId = 0
        responseStatus = 0
        respondedDate = Date()
        respondedId = 0
        createdDate = Date()
        createdId = 0
        updatedDate = Date()
        updatedId = 0
    }

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case alertId = "alert_id"
        case alertResponseId = "alert_response_id"
        case responseStatus = "response_status"
        case respondedDate = "responded_date"
        case respondedId = "responded_id"
        case createdDate = "created_date"
        case createdId = "created_id"
        case updatedDate = "updated_date"
        case updatedId = "updated_id"
    }
}

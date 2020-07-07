//
//  AlertNotificationType.swift
//  AmadaAlert
//
//  Created by IT Support on 7/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct AlertNotificationType: Codable {

    public var id: Int?
    public var description: String?
    public var sortOrder: Int?
    public var status: Int?
    public var createdDate: Date?
    public var createdId: Int?
    public var updatedDate: Date?
    public var updatedId: Int?
    
    init() {
        id = 0
        description = ""
        sortOrder = 0
        status = 0
        createdDate = Date()
        createdId = 0
        updatedDate = Date()
        updatedId = 0
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
        case sortOrder = "sort_order"
        case status = "status"
        case createdDate = "created_date"
        case createdId = "created_id"
        case updatedDate = "updated_date"
        case updatedId = "updated_id"
    }
}

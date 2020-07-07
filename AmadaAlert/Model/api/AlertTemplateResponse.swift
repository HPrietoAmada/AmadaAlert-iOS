//
//  AlertTemplateResponse.swift
//  AmadaAlert
//
//  Created by IT Support on 7/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct AlertTemplateResponse: Codable {

    public var id: Int?
    public var templateAlertId: Int?
    public var responseDesc: String?
    public var status: Int?
    public var createdDate: Date?
    public var createdId: Int?
    public var updatedDate: Date?
    public var updatedId: Int?

    init() {
        id = 0
        templateAlertId = 0
        responseDesc = ""
        status = 0
        createdDate = Date()
        createdId = 0
        updatedDate = Date()
        updatedId = 0
    }

    enum CodingKeys: String, CodingKey {
        case id
        case templateAlertId = "template_alert_id"
        case responseDesc = "response_desc"
        case status
        case createdDate = "created_date"
        case createdId = "created_id"
        case updatedDate = "updated_date"
        case updatedId = "updated_id"
    }
}

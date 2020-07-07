//
//  AlertTemplate.swift
//  AmadaAlert
//
//  Created by IT Support on 7/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct AlertTemplate: Codable {

    public var id: Int?
    public var templateName: String?
    public var notificationType: Int?
    public var byEmail: Int?
    public var byText: Int?
    public var byPush: Int?
    public var nRetries: Int?
    public var retryDelay: Int?
    public var message: String?
    public var allowResponseChange: Int?
    public var status: Int?
    public var createdId: Int?
    public var createdDate: Date?
    public var updatedId: Int?
    public var updatedDate: Date?

    init() {
        id = 0
        templateName = ""
        notificationType = 0
        byEmail = 0
        byText = 0
        byPush = 0
        nRetries = 0
        retryDelay = 0
        message = ""
        allowResponseChange = 0
        status = 0
        createdId = 0
        updatedId = 0
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case templateName = "template_name"
        case notificationType = "notification_type"
        case byText = "by_text"
        case byEmail = "by_email"
        case byPush = "by_push"
        case nRetries = "n_retries"
        case retryDelay = "retry_delay"
        case message = "message"
        case allowResponseChange = "allow_response_change"
        case status = "status"
        case createdId = "created_id"
        case createdDate = "created_date"
        case updatedId = "updated_id"
        case updatedDate = "updated_date"
    }
}

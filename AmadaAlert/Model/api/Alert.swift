//
//  Alert.swift
//  AmadaAlert
//
//  Created by IT Support on 7/9/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct Alert: Codable {
    public var id: Int?
    public var notificationType: Int?
    public var byText: Int?
    public var byEmail: Int?
    public var byPush: Int?
    public var retryGroup: Int?
    public var nRetries: Int?
    public var retryDelay: Int?
    public var retryCount: Int?
    public var message: String?
    public var allowResponseChange: Int?
    public var sendDate: Date?
    public var createdId: Int?
    public var createdDate: Date?
    public var updatedId: Int?
    public var updatedDate: Date?

    init() {
        id = 0
        notificationType = 0
        byText = 0
        byEmail = 0
        byPush = 0
        retryGroup = 0
        nRetries = 0
        retryDelay = 0
        retryCount = 0
        message = ""
        allowResponseChange = 0
        sendDate = Date()
        createdId = 0
        createdDate = Date()
        updatedId = 0
        updatedDate = Date()
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case notificationType = "notification_type"
        case byText = "by_text"
        case byEmail = "by_email"
        case byPush = "by_push"
        case retryGroup = "retry_group"
        case nRetries = "n_retries"
        case retryDelay = "retry_delay"
        case retryCount = "retry_count"
        case message = "message"
        case allowResponseChange = "allow_response_change"
        case sendDate = "send_date"
        case createdId = "created_id"
        case createdDate = "created_date"
        case updatedId = "updated_id"
        case updatedDate = "updated_date"
    }
}

/*

 struct Alert: Codable {
     public var id: Int?
     public var notification_type: Int?
     public var by_text: Int?
     public var by_email: Int?
     public var by_push: Int?
     public var retry_group: Int?
     public var n_retries: Int?
     public var retry_delay: Int?
     public var retry_count: Int?
     public var message: String?
     public var allow_response_change: Int?
     public var send_date: Date?
     public var created_id: Int?
     public var created_date: Date?
     public var updated_id: Int?
     public var updated_date: Date?

     init() {
         id = 0
         notification_type = 0
         by_text = 0
         by_email = 0
         by_push = 0
         retry_group = 0
         n_retries = 0
         retry_delay = 0
         retry_count = 0
         message = ""
         allow_response_change = 0
         send_date = Date()
         created_id = 0
         created_date = Date()
         updated_id = 0
         updated_date = Date()
     }
 }

 */

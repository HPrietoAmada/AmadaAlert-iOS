//
//  DBManager.swift
//  AmadaAlert
//
//  Created by IT Support on 7/23/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct PostResponseModel: Codable {
    public var fieldCount: Int?
    public var affectedRows: Int?
    public var insertId: Int?
    public var serverStatus: Int?
    public var warningCount: Int?
    public var message: String?
    public var protocol41: Bool?
    public var changedRows: Int?
}

typealias NewIdReturned = (PostResponseModel?, Error?) -> Void
typealias NewIdsReturned = ([PostResponseModel], Error?) -> Void

struct DBManager {
    static let shared = DBManager()
}

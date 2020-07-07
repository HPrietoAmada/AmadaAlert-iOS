//
//  WebITUsersOffices.swift
//  AmadaAlert
//
//  Created by IT Support on 7/23/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct WebITUsersOffices: Codable {
    public var ID: Int?
    public var OFFICE_TITLE: String?
    public var OFFICE_ADDRESS: String?
    public var OFFICE_CITY: String?
    public var OFFICE_STATE: String?
    public var OFFICE_ZIP: String?
    public var OFFICE_TOLL_FREE: String?
    public var OFFICE_TOLL: String?
    public var OFFICE_FAX: String?
    public var OFFICE_MAP_URL: String?

    init() {
        ID = 0
        OFFICE_TITLE = ""
        OFFICE_ADDRESS = ""
        OFFICE_CITY = ""
        OFFICE_STATE = ""
        OFFICE_ZIP = ""
        OFFICE_TOLL_FREE = ""
        OFFICE_TOLL = ""
        OFFICE_FAX = ""
        OFFICE_MAP_URL = ""
    }

    init(_ coreModel: WebITUsersOfficesCore) {
        ID = Int(coreModel.id)
        OFFICE_TITLE = coreModel.office_title
        OFFICE_ADDRESS = coreModel.office_address
        OFFICE_CITY = coreModel.office_city
        OFFICE_STATE = coreModel.office_state
        OFFICE_ZIP = coreModel.office_zip
        OFFICE_TOLL_FREE = coreModel.office_toll_free
        OFFICE_TOLL = coreModel.office_toll
        OFFICE_FAX = coreModel.office_fax
        OFFICE_MAP_URL = coreModel.office_map_url
    }
}

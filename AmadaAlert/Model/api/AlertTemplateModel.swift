//
//  AlertTemplateModel.swift
//  AmadaAlert
//
//  Created by IT Support on 7/29/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

struct AlertTemplateModel: Codable {
    public var AlertTemplateInfo: AlertTemplate?
    public var AlertTemplateResponses: [AlertTemplateResponse]?
    public var AlertTemplateGroups: [AlertTemplateUser]?
    init() {
        AlertTemplateInfo = AlertTemplate()
        AlertTemplateResponses = [AlertTemplateResponse]()
        AlertTemplateGroups = [AlertTemplateUser]()
    }
}

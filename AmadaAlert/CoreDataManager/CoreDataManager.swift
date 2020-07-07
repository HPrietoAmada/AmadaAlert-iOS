//
//  CoreDataManager.swift
//  AmadaAlert
//
//  Created by IT Support on 7/30/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import CoreData

typealias ProgressComplete = (_ success: Bool, _ error: Error?) -> Void

struct CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AmadaAlert")
        container.loadPersistentStores(completionHandler: { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        })
        return container
    }()
}

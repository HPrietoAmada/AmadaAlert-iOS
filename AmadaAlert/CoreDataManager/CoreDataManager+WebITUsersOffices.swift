//
//  CoreDataManager+WebITUsers.swift
//  AmadaAlert
//
//  Created by IT Support on 7/30/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import CoreData

typealias webITUsersOfficesReturned = ([WebITUsersOffices]?, Error?) -> Void
typealias webITUsersOfficesCoreReturned = ([WebITUsersOfficesCore]?, Error?) -> Void

extension CoreDataManager {

    func saveWebITUsersOffices(models: [WebITUsersOffices], _ completionHandler: ProgressComplete?) {
        models.forEach { (model) in
            let context = persistentContainer.viewContext
            let object = NSEntityDescription.insertNewObject(forEntityName: "WebITUsersOfficesCore", into: context) as! WebITUsersOfficesCore
            object.setValue(model.ID, forKey: "id")
            object.setValue(model.OFFICE_ADDRESS, forKey: "office_address")
            object.setValue(model.OFFICE_CITY, forKey: "office_city")
            object.setValue(model.OFFICE_FAX, forKey: "office_fax")
            object.setValue(model.OFFICE_MAP_URL, forKey: "office_map_url")
            object.setValue(model.OFFICE_STATE, forKey: "office_state")
            object.setValue(model.OFFICE_TITLE, forKey: "office_title")
            object.setValue(model.OFFICE_TOLL, forKey: "office_toll")
            object.setValue(model.OFFICE_TOLL_FREE, forKey: "office_toll_free")
            object.setValue(model.OFFICE_ZIP, forKey: "office_zip")
            do {
                try context.save()
            }catch let err {
                completionHandler?(false, err)
                return
            }
        }
        completionHandler?(true, nil)
    }

    func getWebITUsersOfficesCore(_ completionHandler: webITUsersOfficesCoreReturned?) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<WebITUsersOfficesCore>(entityName: "WebITUsersOfficesCore")
        do {
            let models = try context.fetch(fetchRequest)
            completionHandler?(models, nil)
        } catch let error {
            completionHandler?(nil, error)
        }
    }

    func getWebITUsersOffices(_ completionHandler: webITUsersOfficesReturned?) {
        var models = [WebITUsersOffices]()
        getWebITUsersOfficesCore { (coreModels, error) in
            if let error = error {
                completionHandler?(nil, error)
                return
            }

            guard let coreModels = coreModels else {
                return
            }

            coreModels.forEach({ (coreModel) in
                let model = WebITUsersOffices(coreModel)
                models.append(model)
            })
        }
        completionHandler?(models, nil)
    }

    func deleteWebITUsersOffices(_ completionHandler: ProgressComplete?) {
        getWebITUsersOfficesCore { (coreModels, error) in
            if let error = error {
                completionHandler?(false, error)
                return
            }

            guard let coreModels = coreModels else {
                completionHandler?(false, nil)
                return
            }

            for coreModel in coreModels {
                let context = CoreDataManager.shared.persistentContainer.viewContext
                context.delete(coreModel)
                do {
                    try context.save()
                } catch let err {
                    completionHandler?(false, err)
                    return
                }
            }
        }
        completionHandler?(true, nil)
    }

}

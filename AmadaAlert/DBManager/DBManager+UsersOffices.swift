//
//  DBManager+UsersOffices.swift
//  AmadaAlert
//
//  Created by IT Support on 7/23/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

extension DBManager {

    /*
        Retreives all WEB_IT.USERS_OFFICES records from oracle database
     */
    func getUsersOffices(_ completionHandler: @escaping ([WebITUsersOffices]?, Error?, String) -> Void) {
        guard let fieldAppURL = Bundle.main.object(forInfoDictionaryKey: "FieldAppAPI") as? String else {
            completionHandler(nil, nil, "")
            return
        }

        let urlString: String = "\(fieldAppURL)GetOffices"

        guard let url = URL(string: urlString) else {
            completionHandler(nil,nil,"Unable to reach Amada Servers.")
            return
        }

        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(nil,error, error?.localizedDescription ?? "Error")
                    return
                }

                if let data = data {
                    do {
                        let sessionModel = try JSONDecoder().decode([WebITUsersOffices].self, from: data)
                        completionHandler(sessionModel, error, "Success")
                    } catch let err {
                        completionHandler(nil,err,err.localizedDescription)
                    }
                } else {
                    completionHandler(nil, error, "No Data Found.")
                }
            }
        }
        task.resume()
    }

}

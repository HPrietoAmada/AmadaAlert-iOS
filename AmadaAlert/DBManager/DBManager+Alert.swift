//
//  DBManager+Alert.swift
//  AmadaAlert
//
//  Created by IT Support on 2/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import Foundation
import CoreData

typealias AlertListReturned = ([Alert], Error?) -> Void
typealias AlertReturned = (Alert?, Error?) -> Void

extension DBManager {

    func create(_ model: Alert, completionHandler: NewIdReturned?) {
        do {
            let obj = try JSONEncoder().encode(model)
            guard let json = String(data: obj, encoding: .utf8),
                let apiURL = Bundle.main.object(forInfoDictionaryKey: "AmadaAlertAPI") as? String,
                let url = URL(string: "\(apiURL)/alert") else {
                    completionHandler?(nil, nil)
                return
            }
            print("create Alert:", json)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = json.data(using: .utf8)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler?(nil, error)
                    }
                    return
                }
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler?(nil, error)
                    }
                    return
                }
                do {
                    let res = try JSONDecoder().decode(PostResponseModel.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler?(res, nil)
                    }
                } catch let err { // create share with domain user account
                    DispatchQueue.main.async {
                        completionHandler?(nil, err)
                    }
                }
            }
            task.resume()
        } catch let err {
            completionHandler?(nil, err)
        }
    }

    func getAlertById(_ alertId: Int,_ completionHandler: AlertReturned?) {
        guard let api = Bundle.main.object(forInfoDictionaryKey: "AmadaAlertAPI") as? String else {
            completionHandler?(nil, nil)
            return
        }

        let urlString: String = "\(api)/alert/\(alertId)"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) { (data, res, error) in
            if let error = error {
                completionHandler?(nil, error)
                return
            }

            if let data = data {
                do {
                    let sessionModel = try JSONDecoder().decode(Alert.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler?(sessionModel, nil)
                    }
                } catch let err {
                    DispatchQueue.main.async {
                        completionHandler?(nil, err)
                    }
                }
            }
        }
        task.resume()
    }

    func getAll(_ completionHandler: AlertListReturned?) {
        guard let api = Bundle.main.object(forInfoDictionaryKey: "AmadaAlertAPI") as? String else {
            completionHandler?([], nil)
            return
        }

        let urlString: String = "\(api)/alert"

        guard let url = URL(string: urlString) else { return }

        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) { (data, res, error) in
            if let error = error {
                completionHandler?([], error)
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    let sessionModel = try decoder.decode([Alert].self, from: data)
                    DispatchQueue.main.async {
                        completionHandler?(sessionModel, nil)
                    }
                } catch let err {
                    DispatchQueue.main.async {
                        completionHandler?([], err)
                    }
                }
            }
        }
        task.resume()
    }
}

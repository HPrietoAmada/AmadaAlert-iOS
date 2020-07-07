//
//  DBManager+AlertTemplateResponse.swift
//  AmadaAlert
//
//  Created by HPrietoAmada on 2/20/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import Foundation
import CoreData

typealias AlertTemplateResponseReturned = (AlertTemplateResponse?, Error?) -> Void
typealias AlertTemplateResponseListReturned = ([AlertTemplateResponse], Error?) -> Void

extension DBManager {

    func create(_ model: AlertTemplateResponse, completionHandler: NewIdReturned?) {
       do {
           let obj = try JSONEncoder().encode(model)
           guard let json = String(data: obj, encoding: .utf8),
               let apiURL = Bundle.main.object(forInfoDictionaryKey: "AmadaAlertAPI") as? String,
               let url = URL(string: "\(apiURL)/alert-template-response/") else {
                   completionHandler?(nil, nil)
                   return
           }
           print(json)
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
               } catch let err {
                   DispatchQueue.main.async {
                       completionHandler?(nil, err)
                   }
               }
           }
           task.resume()
       } catch let error {
           completionHandler?(nil, error)
       }
    }

    func create(_ models: [AlertTemplateResponse], completionHandler: NewIdsReturned?) {
        do {
            let obj = try JSONEncoder().encode(models)
            guard let json = String(data: obj, encoding: .utf8),
                let apiURL = Bundle.main.object(forInfoDictionaryKey: "AmadaAlertAPI") as? String,
                let url = URL(string: "\(apiURL)/alert-template-response/list") else {
                    completionHandler?([], nil)
                    return
            }
            print("Creating Alert Response: \(json)")
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = json.data(using: .utf8)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler?([], error)
                    }
                    return
                }
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler?([], error)
                    }
                    return
                }
                do {
                    let res = try JSONDecoder().decode([PostResponseModel].self, from: data)
                    DispatchQueue.main.async {
                        completionHandler?(res, nil)
                    }
                } catch let err {
                    DispatchQueue.main.async {
                        completionHandler?([], err)
                    }
                }
            }
            task.resume()
        } catch let error {
            completionHandler?([], error)
        }
    }

    func getAlertTemplateResponsesByAlertId(_ id: Int, _ completionHandler: AlertTemplateResponseListReturned?) {
        guard let api = Bundle.main.object(forInfoDictionaryKey: "AmadaAlertAPI") as? String else {
            completionHandler?([], nil)
            return
        }
        let urlString: String = "\(api)/alert-template-response/alert-template-id/\(id)"
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
                    let sessionModel = try JSONDecoder().decode([AlertTemplateResponse].self, from: data)
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

    func getAllAlertResponses(_ completionHandler: AlertTemplateResponseListReturned?) {
        guard let api = Bundle.main.object(forInfoDictionaryKey: "AmadaAlertAPI") as? String else {
            completionHandler?([], nil)
            return
        }
        let urlString: String = "\(api)/alert-template-response"
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
                    let sessionModel = try JSONDecoder().decode([AlertTemplateResponse].self, from: data)
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

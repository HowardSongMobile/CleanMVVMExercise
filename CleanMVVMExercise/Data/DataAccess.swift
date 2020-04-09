//
//  DataAccess.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

class DataAccess: FetchProgram {
    
    init() {
    }
    
    //single key data in response, it is used in this demo
    func fetchSingleKeyData(completeHandler: @escaping(String?, Error?) -> ()) -> Void {
        
        NetworkServices.shared.apiWithURLSession(completeHandler: {(data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    if let keyData = json?[Constant.keyDataKey] as? String{
                        print(keyData)
                        completeHandler(keyData, nil)
                    }else{
                        completeHandler(nil, error)
                    }
                    
                } catch let error {
                    completeHandler(nil, error)
                }
            }else{
                completeHandler(nil, error)
            }
        })
    }
    
    //if you want to multiple key data, use it
    func fetchKeyData(completeHandler: @escaping([String: Any]?, Error?) -> ()) -> Void {
        
        NetworkServices.shared.apiWithURLSession(completeHandler: {(data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    completeHandler(json, error)
                    
                } catch let error {
                    completeHandler(nil, error)
                }
            }else{
                completeHandler(nil, error)
            }
        })
    }

    //if you want to whole response data, use it
    func fetchTSNProgram(completeHandler: @escaping ([Program]?, Error?) -> ()) {
        
        NetworkServices.shared.apiWithURLSession(completeHandler: {(data, response, error) in
            
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([Program].self, from: data)
                    completeHandler(decoded, error)
                    
                } catch let error {
                    completeHandler(nil, error)
                }
            }else{
                completeHandler(nil, error)
            }
        })
    }
    
}

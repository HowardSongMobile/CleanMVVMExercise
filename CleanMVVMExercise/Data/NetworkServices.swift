//
//  Network.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

class NetworkServices{
    
    static let shared = NetworkServices()
    
    init() {
    }
    
    func apiWithURLSession(completeHandler: @escaping(Data?, URLResponse?, Error?) -> ()) -> Void {
        
        guard let url = URL(string: Constant.urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            completeHandler(data, response, error)
        }.resume()
    }
    
    //it can be used unit test with mocked data
    func apiWithMockData(completeHandler: @escaping(Data?, Error?) -> ()) -> Void {
        let str = "{\"LastModifiedDateTime\": \"2020-02-10T15:49:05Z\"}"
        let data = Data(str.utf8)
        let error: NSError? = nil
        
        completeHandler(data, error)
    }
}

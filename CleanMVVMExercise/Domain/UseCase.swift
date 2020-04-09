//
//  UseCase.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

protocol FetchProgram {
    
    //fetch single key data
    func fetchSingleKeyData(completeHandler: @escaping(String?, Error?) -> ()) -> Void
    
    //when fetching multiple key data
    func fetchKeyData(completeHandler: @escaping([String: Any]?, Error?) -> ()) -> Void
    
    //when fetching whole program data
    func fetchTSNProgram(completeHandler: @escaping([Program]?, Error?) -> ()) -> Void
}


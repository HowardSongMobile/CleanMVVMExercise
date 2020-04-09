//
//  ViewModel.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

//please note: do not import UIKit or SwiftUI into view model

class ViewModel {
    
    var observeVariable: ObservableObject<String> = ObservableObject("")
    
    init() {
    }
    
    func lookupKeyData() -> Void {
        let access = DataAccess()
        access.fetchSingleKeyData(completeHandler: {[weak self](result, error) in
            if let result = result {
                DispatchQueue.main.async {
                    let date = stringToDate(dateString: result)
                    let readableString = dateToReadableString(date: date ?? Date())
                    self?.observeVariable.value = readableString ?? "There was no key data"
                }
            }else{
                self?.observeVariable.value = error?.localizedDescription ?? "There was no key data"
            }
        })
    }
}

//
//  Observe.swift
//  CleanMVVMExercise
//
//  Created by Song on 2020-04-09.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

//ObservableObject is a closure based Observe that is used in MVVM to observe the item of view in this demo
//Other solutions of oberve - RxSwift, KVO, protocol, delegate, notification etc

public final class ObservableObject<T> {

    private var closure: ((T) -> ())?    

    public var value: T {
        didSet { closure?(value) }
    }
    
    public init(_ value: T) {
        self.value = value
    }

    public func observe(_ closure: @escaping (T) -> Void) {
        self.closure = closure
        closure(value)
    }
    
}

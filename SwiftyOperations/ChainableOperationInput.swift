//
//  ChainableOperationInput.swift
//  SwiftyOperations
//
//  Created by Popov Valery on 10/10/15.
//  Copyright © 2015 Popov Valery. All rights reserved.
//

import Foundation

protocol ChainableOperationInput {
    
    typealias ValidatedType
    func obtainInputData(validationBlock: (ValidatedType) -> Bool)
}


struct ChainableOperationInputThunk<T>: ChainableOperationInput {
    
    private let _obtainInputData: ((T) -> Bool) -> Void
    
    init<P: ChainableOperationInput where P.ValidatedType == T>(_ dep: P) {
        _obtainInputData = dep.obtainInputData
    }
    
    func obtainInputData(validationBlock: (T) -> Bool) {
        _obtainInputData(validationBlock)
    }
}
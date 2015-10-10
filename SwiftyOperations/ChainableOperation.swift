//
//  ChainableOperation.swift
//  SwiftyOperations
//
//  Created by Popov Valery on 10/10/15.
//  Copyright © 2015 Popov Valery. All rights reserved.
//

import Foundation

protocol ChainableOperation: Completable {
    
    var input: ChainableOperationInputThunk<NSOperation>? { get set }
    
    var output: ChainableOperationOutput?  { get set }
    
}
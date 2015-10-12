//
//  CompoundOperationBase.swift
//  SwiftyOperations
//
//  Created by Popov Valery on 10/10/15.
//  Copyright © 2015 Popov Valery. All rights reserved.
//

import Foundation

let DefaultMaxConcurrentOperationsCount = 3

class CompoundOperationBase<T>: AsyncOperation {
    
    var maxConcurrentOperationCount: Int = DefaultMaxConcurrentOperationsCount {
        didSet {
            if maxConcurrentOperationCount > 0 {
                self.operationQueue.maxConcurrentOperationCount = maxConcurrentOperationCount
            }
        }
    }
    
    private var operationQueue: NSOperationQueue = {
        let queue = NSOperationQueue()
        queue.name = "ru.swifty.operations.$%&"
        queue.maxConcurrentOperationCount = DefaultMaxConcurrentOperationsCount
        queue.suspended = true
        return queue
    }()
    
    
    var result: ((T, NSError) -> Void)?
    
    
    override func main() {
        operationQueue.suspended = false
    }
    
    
    override func cancel() {
        super.cancel()
        operationQueue.cancelAllOperations()
    }
    
    
    override func onComplete(completion: () -> Void) {
        completion()
    }
}


infix operator <| { associativity left precedence 160 }
func <| <T>(left: CompoundOperationBase<T>, right: NSOperation) -> CompoundOperationBase<T> {
    left.operationQueue.addOperation(right)
    return left
}


infix operator ~> { associativity left precedence 180 }
func ~> <T, U>(left: CompoundOperationBase<T>, right: CompoundOperationBase<U>) -> CompoundOperationBase<U> {
    left.addDependency(right)
    return right
}
//
// Created by Popov Valery on 10/10/15.
// Copyright (c) 2015 Popov Valery. All rights reserved.
//

import Foundation

enum AsyncOperationStatus {
    case OperationNotStarted
    case OperationExecuting
    case OperationFinished
}

class AsyncOperation: NSOperation, Completable {
    
    lazy var operationStatus: AsyncOperationStatus = .OperationNotStarted
    
    override init() {
        super.init()
    }
    
    internal override func start() {
        
        if cancelled {
            operationStatus = .OperationFinished
            return
        }
        
        NSThread.detachNewThreadSelector("main", toTarget: self, withObject: nil)
        operationStatus = .OperationExecuting
    }
    
    override func main() {
    }
    
    func onComplete(completion: () -> Void) {
        operationStatus = .OperationFinished
        completion()
    }
}

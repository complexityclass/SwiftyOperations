//
//  MyAsyncOperation.swift
//  SwiftyOperations
//
//  Created by Popov Valery on 10/10/15.
//  Copyright © 2015 Popov Valery. All rights reserved.
//

import Foundation

class MyAsyncOperation: AsyncOperation {

    override func main() {
        
        var index = 0
        var steps = 0
        while index < 10000 {
            let someVar  = index + 37
            
            if someVar % 10 == 0 {
                index += 2
                print("thread: \(NSThread.currentThread())")
            } else {
                index += 1
            }
            steps += 1
        }
        
        dispatch_async(dispatch_get_main_queue(), {
            print("steps to result = \(steps) in thread \(NSThread.currentThread())")
        })
        
    }
    
}

//
//  Promise.swift
//  SwiftyOperations
//
//  Created by Popov Valery on 12/10/15.
//  Copyright © 2015 Popov Valery. All rights reserved.
//

import UIKit

class Promise<T> {
    
    private var value: T?
    private var handlers: [T -> ()] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    private func resolve(promise: Promise<T>) {
        promise.reserve {
            if self.value != nil {
                return
            }
            
            self.value = $0
            
            for handler in self.handlers {
                handler($0)
            }
            
            self.handlers.removeAll(keepCapacity: false)
        }
    }
    
    
    private func reserve(handler: T -> ()) {
        if let value = self.value {
            handler(value)
        } else {
            handlers.append(handler)
        }
    }

    
    func then<H>(f: T -> Promise<H>) -> Promise<H> {
        return Promise<H> { resolve in self.reserve { resolve(f($0)) } }
    }

}

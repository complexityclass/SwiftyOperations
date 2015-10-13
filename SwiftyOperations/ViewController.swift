//
//  ViewController.swift
//  SwiftyOperations
//
//  Created by Popov Valery on 10/10/15.
//  Copyright © 2015 Popov Valery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func asyncGet(value: Int) -> Promise<Int> {
        
        let promise = Promise(value + 2)
        
        return promise
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let a = asyncGet(6).then { self.asyncGet($0) }.then { self.asyncGet($0)}
        
        print(a)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

/*
let compoundOp1 = CompoundOperationBase<String?>()
        compoundOp1.result = { str , _ in
            if str != nil {
                print(str)
            }
        }
        
        let compoundOp2 = CompoundOperationBase<Int>()
        compoundOp2.result = {count, _ in
            print(count)
        }
        
        let op1 = NSBlockOperation { () -> Void in
            print("task 1 executed")
        }
        
        let op2 = NSBlockOperation { () -> Void in
            print("task 2 executed")
        }
        
        let op3 = NSBlockOperation { () -> Void in
            print("task 3 executed")
        }
        
        compoundOp1 <| op1 <| op2 <| op3
        _ = compoundOp1 ~> compoundOp2
        
        compoundOp1.start()
    
*/


}


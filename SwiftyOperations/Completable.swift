//
//  Completable.swift
//  SwiftyOperations
//
//  Created by Popov Valery on 10/10/15.
//  Copyright © 2015 Popov Valery. All rights reserved.
//

import Foundation

protocol Completable {

    func onComplete(completion: () -> Void)
    
}

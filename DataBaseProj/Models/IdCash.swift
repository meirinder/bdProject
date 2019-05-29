//
//  AccountCash.swift
//  DataBaseProj
//
//  Created by Savely on 29/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class IdCash {
    static let `default` = IdCash()
    
    var value: Int? {
        didSet {
            if let value = value {
                let dbw = DataBaseWorker()
                account = dbw.getAccount(id: value)
            }
        }
    }
    var account: Account?
    
}

//
//  SignUpModel.swift
//  DataBaseProj
//
//  Created by Savely on 05/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class SignUpModel: Object {
    @objc dynamic var login: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var id: Int = 0
     
}
    
    


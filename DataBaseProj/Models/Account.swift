//
//  Account.swift
//  DataBaseProj
//
//  Created by Savely on 27/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class Account: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var birthday: String = ""
    var books = List<Book>()
}

//
//  Librarie.swift
//  DataBaseProj
//
//  Created by Savely on 26/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class Handbook: Object {
    var libraries = List<Librarie>()
}

class Librarie: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var address: String = ""
    var books = List<Book>()
}

class Book: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var count: Int = 0
    @objc dynamic var isFavourite: Bool = false
}

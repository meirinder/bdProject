//
//  AddBookViewController.swift
//  DataBaseProj
//
//  Created by Savely on 29/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class AddBookViewController: UIViewController {
    
    var handBook: Handbook!
    var index: Int!
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var authorLabel: UITextField!
    @IBOutlet weak var countLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    private let realm = try! Realm()
 
    @IBAction func addAction(_ sender: Any) {
        try! realm.write {
            var book = Book()
            book.author = authorLabel.text!
            book.name = nameLabel.text!
            book.count = Int(countLabel.text!)!
            handBook.libraries[index].books.append(book)
        }
    }
    
}

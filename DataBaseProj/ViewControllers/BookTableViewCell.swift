//
//  BookTableViewCell.swift
//  DataBaseProj
//
//  Created by Savely on 27/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class BookTableViewCell: UITableViewCell {
    
    var handbook: Handbook!
    var indexLibr: Int!
    var indexBook: Int!
    weak var alertDelegate: BookAlertDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var countConstLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        getBookButton.addTarget(self, action: #selector(getBook), for: .touchDown)
        starButton.addTarget(self, action: #selector(changeFavourite), for: .touchDown)
    }
    @IBOutlet weak var getBookButton: UIButton!
    
    @objc
    private func changeFavourite() {
        let dbw = DataBaseWorker()
        if handbook.libraries[indexLibr].books[indexBook].isFavourite {
            dbw.changefavouriteState(book: indexBook, lib: indexLibr, state: !handbook.libraries[indexLibr].books[indexBook].isFavourite)
            alertDelegate?.reload()            
        } else {
            dbw.changefavouriteState(book: indexBook, lib: indexLibr, state: !handbook.libraries[indexLibr].books[indexBook].isFavourite)
            alertDelegate?.reload()
        }
        
    }
    
    private let realm = try! Realm()
    
    @objc
    private func getBook() {
        let count = handbook.libraries[indexLibr].books[indexBook].count
        if count >= 1 {
            let dbw = DataBaseWorker()
            
            dbw.bookCount(book: indexBook, lib: indexLibr, value: -1)
            let account = IdCash.default.account
            try! realm.write {
                 account?.books.append(handbook.libraries[indexLibr].books[indexBook])
            }
            alertDelegate?.alert(message: "Вы взяли книгу")
            alertDelegate?.reload()         } else {
            alertDelegate?.alert(message: "Книг больше нет")
        }
    }
}

protocol BookAlertDelegate: class {
    func alert(message: String)
    func reload()
}

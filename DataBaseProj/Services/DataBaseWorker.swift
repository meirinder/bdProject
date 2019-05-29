//
//  DataBaseWorker.swift
//  DataBaseProj
//
//  Created by Savely on 05/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class DataBaseWorker {

    let realm = try! Realm()

    
    func signUp(login: String, password: String) {
        let signUpModel = SignUpModel()
        signUpModel.login = login
        signUpModel.password = password
        
        try! realm.write {
            if let model = realm.objects(SignUpModel.self).sorted(byKeyPath: "id").first {
                signUpModel.id = model.id + 1
            } else {
                signUpModel.id = 1
            }
            let newaccount = Account()
            newaccount.id = signUpModel.id
            realm.add(newaccount)
            realm.add(signUpModel)
        }
    }
    
    
    func logIn(login: String, password: String) -> (Bool,Int?) {
        if let check = realm.objects(SignUpModel.self).filter("login = '\(login)' AND password = '\(password)'").first {
            return (true,check.id)
        }
        return (false,nil)
    }
    
    func getAccount(id: Int) -> Account {
        var account = Account()
        try! realm.write {
            if let loadedAccount = realm.objects(Account.self).filter("id = \(id)").first {
                account = loadedAccount
            }
        }
        return account
    }
    
    func loadHandbook() -> Handbook {
        var result = Handbook()
        try! realm.write {
            result = realm.objects(Handbook.self).first!
        }
        return result
    }

    func changefavouriteState(book:Int, lib: Int, state: Bool) {
        try! realm.write {
            let oldHandBook = realm.objects(Handbook.self)
            oldHandBook.first?.libraries[lib].books[book].isFavourite = state
        }
    }
 
    
    func favouriteBooksinLibrs() -> List<Librarie>? {
        let libraries = List<Librarie>()
        try! realm.write {
            let newLibraries = realm.objects(Librarie.self)
            for librarie in newLibraries {
                libraries.append(librarie)
            }
        }
        return libraries
    }
    
    func bookCount(book:Int, lib: Int, value: Int) {
        try! realm.write {
            let oldHandBook = realm.objects(Handbook.self)
            oldHandBook.first?.libraries[lib].books[book].count += value
        }
    }
    
    func saveHandbook(handBook: Handbook) {
        try! realm.write {
            let oldHandBook = realm.objects(Handbook.self)
            realm.delete(oldHandBook)
            realm.add(handBook)
        }
    }
    
}

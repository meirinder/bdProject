//
//  MyBooksViewController.swift
//  DataBaseProj
//
//  Created by Savely on 29/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class MyBooksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var account: Account!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        account = IdCash.default.account
    }
    
 

}

extension MyBooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let book = account.books[indexPath.row]
        cell.authorLabel.text = book.author
        cell.nameLabel.text = book.name
        cell.countLabel.isHidden = true
        cell.countConstLabel.isHidden = true
        if book.isFavourite {
            cell.starButton.setImage(UIImage(named: "favourite_on"), for: .normal)
        } else {
            cell.starButton.setImage(UIImage(named: "favourite_off"), for: .normal)
        }
        cell.handbook = Handbook() 
        cell.indexBook = indexPath.row
        cell.indexLibr = 0
        cell.starButton.isHidden = true
        return cell
    }
    
    
}

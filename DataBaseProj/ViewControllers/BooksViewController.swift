//
//  BooksViewController.swift
//  DataBaseProj
//
//  Created by Savely on 27/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class BooksViewController: UIViewController {
    
    var handbook: Handbook!
    var index: Int!
    @IBOutlet weak var booksTableView: UITableView!
    @IBOutlet weak var addBookButtton: UIButton!
    @IBOutlet weak var countConstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        booksTableView.delegate = self
        booksTableView.dataSource = self
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddBookViewController
        vc.handBook = handbook
        vc.index = index
    }
    
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate, BookAlertDelegate {
    func alert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func reload() {
        DispatchQueue.main.async {
            let dbw = DataBaseWorker()
            self.handbook = dbw.loadHandbook()
            self.booksTableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return handbook.libraries[index].books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let book = handbook.libraries[index].books[indexPath.row]
        cell.authorLabel.text = book.author
        cell.nameLabel.text = book.name
        cell.countLabel.text = "\(book.count)"
        if book.isFavourite {
            cell.starButton.setImage(UIImage(named: "favourite_on"), for: .normal)
        } else {
            cell.starButton.setImage(UIImage(named: "favourite_off"), for: .normal)
        }
        cell.handbook = handbook
        cell.alertDelegate = self
        cell.indexBook = indexPath.row
        cell.indexLibr = index
        cell.countConstLabel.isHidden = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

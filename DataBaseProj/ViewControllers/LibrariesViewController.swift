//
//  LibrariesViewController.swift
//  DataBaseProj
//
//  Created by Savely on 26/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class LibrariesViewController: UIViewController {

    
    @IBOutlet weak var librsTableView: UITableView!
    @IBOutlet weak var newLibrTextField: UITextField!
    @IBOutlet weak var addLibrButton: UIButton!
    
    var viewModel = LibrariesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        librsTableView.delegate = self
        librsTableView.dataSource = self
    }
    
 

}

extension LibrariesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "librCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = viewModel.cellText(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBOard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBOard.instantiateViewController(withIdentifier: "BooksViewController") as! BooksViewController
        vc.handbook = viewModel.handBook
        vc.index = indexPath.row 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

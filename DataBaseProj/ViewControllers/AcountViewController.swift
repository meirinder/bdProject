//
//  AcountViewController.swift
//  DataBaseProj
//
//  Created by Savely on 28/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit
import RealmSwift

class AcountViewController: UIViewController {
    
 
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var gettedBooksButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var account = IdCash.default.account
        nameTextField.text = account!.name
        lastnameTextField.text = account!.lastname
        birthdayTextField.text = account!.birthday
    }
     
    
    private let realm = try! Realm()
}

extension AcountViewController: UITextFieldDelegate {

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        try! realm.write {
            var account = IdCash.default.account
            if textField == nameTextField {
                account?.name = nameTextField.text!
            } else if textField == lastnameTextField {
                account?.lastname = lastnameTextField.text!
            } else if textField == birthdayTextField {
                account?.birthday = birthdayTextField.text!
            }
        }
    }
}

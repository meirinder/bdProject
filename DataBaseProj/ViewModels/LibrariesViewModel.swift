//
//  LibrariesViewModel.swift
//  DataBaseProj
//
//  Created by Savely on 26/05/2019.
//  Copyright © 2019 Sibers. All rights reserved.
//

import UIKit

class LibrariesViewModel {

    var handBook = Handbook()
    private var dataBaseWorker = DataBaseWorker()
    
    init() {
        handBook = dataBaseWorker.loadHandbook()
    }
    
    func cellsCount() -> Int {
        return handBook.libraries.count
    }
    
    func cellText(index: Int) -> String {
        return handBook.libraries[index].name
    } 
}

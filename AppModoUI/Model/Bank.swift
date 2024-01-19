//
//  Bank.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class Bank: Decodable {
    
    var id: String?
    var name: String?
    var imageUrl: String?
    
    init(){}
    
    init(id: String? = nil, name: String? = nil, imageUrl: String? = nil) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
    
}

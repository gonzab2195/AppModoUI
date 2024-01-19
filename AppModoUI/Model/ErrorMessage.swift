//
//  Error.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class ErrorMessage: Decodable {
    
    var message: String?
    
    init(){}
    
    init(message: String) {
        self.message = message
    }
    
}

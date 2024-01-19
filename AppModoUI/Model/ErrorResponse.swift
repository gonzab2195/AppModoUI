//
//  ErrorResponse.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class ErrorResponse: Decodable {
    
    var errors: [ErrorMessage]?
    var internalCode: String?
    
    init(){}
    
    init(errors: [ErrorMessage], internalCode: String) {
        self.errors = errors
        self.internalCode = internalCode
    }
}

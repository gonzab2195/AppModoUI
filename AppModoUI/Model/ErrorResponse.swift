//
//  ErrorResponse.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

struct ErrorResponse: Decodable {
    
   let errors: [ErrorMessage]
   let internalCode: String
    
}

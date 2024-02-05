//
//  MenuPresenter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import Foundation

class MenuPresenter {
    
    func getUser() -> User? {
        return User.getUserFromKeychain()
    }
    
    
    
}

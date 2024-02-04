//
//  ViewManagerPresenter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 02/02/2024.
//

import UIKit

class ViewManagerPresenter {
    
    var view: UIViewController
    let router = ViewManagerRouter()
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func doLogout(){
        
        Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.ACCESS_TOKEN)
        Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.REFRESH_TOKEN)
        Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.ME)
        
        router.goToLogin(currentView: view)
    }
    
}

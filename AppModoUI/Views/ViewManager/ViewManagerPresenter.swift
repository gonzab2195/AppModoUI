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
        
        let deleted = Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.ACCESS_TOKEN)
        let _ = Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.REFRESH_TOKEN)
        let _ = Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.ME)
        
        if deleted {
            router.goToLogin(currentView: view)
        }
       
    }
    
}

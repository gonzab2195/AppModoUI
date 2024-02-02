//
//  ViewManager.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 19/01/2024.
//

import UIKit

class ViewManager: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewManager.doLogout), name: Notification.Name(ObserversNames.LOG_OUT), object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func doLogout(){
        
        Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.ACCESS_TOKEN)
        Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.REFRESH_TOKEN)
        Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.ME)
        
        Navigation.redirectToStoryboard(currentView: self,
                                        viewControllerID: ViewControllerNames.LOGIN_VIEW.rawValue, animated: false)
        
    }
}

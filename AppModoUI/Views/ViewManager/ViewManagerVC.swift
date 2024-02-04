//
//  ViewManager.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 19/01/2024.
//

import UIKit

class ViewManagerVC: UIViewController{
    
    var viewManagerPresenter: ViewManagerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewManagerPresenter = ViewManagerPresenter(view: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewManagerVC.notLogged), name: Notification.Name(ObserversNames.LOG_OUT), object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func notLogged(){
        
        viewManagerPresenter?.doLogout()
        
    }
}

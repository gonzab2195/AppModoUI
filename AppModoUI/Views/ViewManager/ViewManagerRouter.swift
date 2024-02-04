//
//  ViewManagerRouter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 02/02/2024.
//

import UIKit

class ViewManagerRouter {
    
    func goToLogin(currentView: UIViewController){
        
        Navigation.redirectToStoryboard(currentView: currentView,
                                        viewControllerID: ViewControllerNames.LOGIN_VIEW.rawValue, animated: false)
        
    }
    
}

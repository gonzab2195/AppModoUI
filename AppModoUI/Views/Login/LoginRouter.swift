//
//  LoginRouter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 22/01/2024.
//

import UIKit

protocol LoginRouterProtocol {
    func navigateToHome(currentView: UIViewController) -> Void
}

class LoginRouter: LoginRouterProtocol {
    
    func navigateToHome(currentView: UIViewController){
        Navigation.redirectToViewController(fromView: currentView, toView: HomeTabVC())
    }
}

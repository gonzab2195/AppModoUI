//
//  LoginRouter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 22/01/2024.
//

import Foundation

protocol LoginRouterProtocol {
    func navigateToHome(currentView: LoginPresenterProtocol) -> Void
}

class LoginRouter: LoginRouterProtocol {
    
    func navigateToHome(currentView: LoginPresenterProtocol){
        Navigation.redirectToStoryboard(currentView: currentView as! ViewManager,
                                        storyboardID: StoryboardNames.HOME_STORYBOARD,
                                        viewControllerID: ViewControllerNames.HOME_VIEW)
    }
}

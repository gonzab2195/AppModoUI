//
//  Navigation.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 16/01/2024.
//

import UIKit

struct Navigation {
 
    static func hideNavigationBar(view : ViewManager){
        view.navigationController?.navigationBar.isHidden=true
        view.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    static func redirectToStoryboard(currentView: ViewManager, storyboardID: String, viewControllerID: String){
        DispatchQueue.main.async {
            
            let homeStoryboard = UIStoryboard(
                name: storyboardID,
                bundle: nil)
            
            let homeVC = homeStoryboard.instantiateViewController(
                withIdentifier: viewControllerID) as! ViewManager
                
            currentView.navigationController?.pushViewController(
                    homeVC, animated: true)
            
        }
    }
    
    static func redirectToViewController(fromView: ViewManager, toView: ViewManager){
        fromView.navigationController?.pushViewController(toView, animated: true)
    }
    
}


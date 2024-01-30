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

    static func redirectToStoryboard(currentView: UIViewController, viewControllerID: String, animated: Bool?){
        DispatchQueue.main.async {
            
            let storyboard = UIStoryboard(
                name: viewControllerID,
                bundle: nil)
            
            let viewController = storyboard.instantiateViewController(
                withIdentifier: viewControllerID) as! ViewManager
                
            currentView.navigationController?.pushViewController(
                viewController, animated: animated != nil ? animated! : true)
            
        }
    }
    
    static func redirectToViewController(fromView: UIViewController, toView: UIViewController){
        
        fromView.navigationController?.pushViewController(toView, animated: true)
    }
    
}


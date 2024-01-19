//
//  Navigation.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 16/01/2024.
//

import UIKit

func hideNavigationBar(view : UIViewController){
    view.navigationController?.navigationBar.isHidden=true
    view.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
}

func redirectToStoryboard(currentView: UIViewController, storyboardID: String, viewControllerID: String){
    DispatchQueue.main.async {
       
        let homeStoryboard = UIStoryboard(
            name: storyboardID,
            bundle: nil)
        
        let homeVC = homeStoryboard.instantiateViewController(
            withIdentifier: viewControllerID) as! HomeVC
            
        currentView.navigationController?.pushViewController(
                homeVC, animated: true)
        
    }
}

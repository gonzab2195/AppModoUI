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

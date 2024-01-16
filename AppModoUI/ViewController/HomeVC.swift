//
//  HomeVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 16/01/2024.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden=true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
}

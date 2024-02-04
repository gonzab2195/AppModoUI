//
//  MenuVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 29/01/2024.
//

import UIKit

class MenuVC: ViewManagerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Navigation.hideNavigationBar(view: self)
               
        let label = UILabel()
        label.text = "menu"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}

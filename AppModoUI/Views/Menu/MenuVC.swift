//
//  MenuVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 29/01/2024.
//

import UIKit

class MenuVC: ViewManagerVC {
    
    private let menuPresenter = MenuPresenter()
    
    private var menuOptions = MenuOptions()
    private var avatarView: UserAvatar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.configureUserAvatar()
        self.configureMenuOptions()
    }
    
    private func configureUserAvatar(){
        
        let viewWidth = Double(view.frame.width / 1.5);
        
        avatarView = UserAvatar(user: menuPresenter.getUser(), width: viewWidth, profileAvatar: true)
        
        
        self.view.addSubview(avatarView!)
        
        NSLayoutConstraint.activate([
            avatarView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            avatarView!.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor,constant: 20),
            avatarView!.widthAnchor.constraint(equalToConstant: viewWidth),
            avatarView!.heightAnchor.constraint(equalToConstant: 110)
        ])
        
    }
    
    private func configureMenuOptions(){
        
        self.view.addSubview(menuOptions)
        
        NSLayoutConstraint.activate([
            menuOptions.topAnchor.constraint(equalTo: avatarView!.bottomAnchor, constant: 20),
            menuOptions.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            menuOptions.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            menuOptions.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

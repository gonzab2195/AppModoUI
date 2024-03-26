//
//  HomeTabVCViewController.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 30/01/2024.
//

import UIKit

class HomeTabVC: UITabBarController {
    
    let homeTabPresenter = HomeTabPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configure()
    }
    
    private func configure(){
        
        UsersDefault.saveToUserDefault(key: UsersDefaultsKeys.MENU_SELECTED,
                                       save: ViewControllerNames.HOME_VIEW.rawValue)
        
        self.view.backgroundColor = .systemBackground
        
        self.tabBar.isHidden = true
        
        self.setViewControllers(self.createNavs(tabs: homeTabPresenter.homeTabs), animated: true)
        
        let customTabBar = HomeTabBar(viewController: self)
        
        self.view.addSubview(customTabBar)
        
        NSLayoutConstraint.activate([
            customTabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            customTabBar.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            customTabBar.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -15),
            customTabBar.heightAnchor.constraint(equalToConstant: 90),
         ])
        
    }
    
    private func createNavs(tabs: [Tab]) -> [UINavigationController] {
        
        var navs: [UINavigationController] = []
        
        for tab in tabs {

            let nav = UINavigationController(rootViewController: tab.viewController)
            
            nav.tabBarItem.title = tab.title
            nav.tabBarItem.image = tab.image
            
            navs.append(nav)
        }
       
        
        return navs
        
    }

}

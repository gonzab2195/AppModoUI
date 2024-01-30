//
//  HomeTabVCViewController.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 30/01/2024.
//

import UIKit

class HomeTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configure()
    }
    
    private func configure(){
        
        self.view.backgroundColor = .systemBackground
        
        
        let home = self.createNav(title: "Inicio", 
                                  image: UIImage(named: "homeIcon"),
                                  viewController: HomeVC())
        let promos = self.createNav(title: "Promos", 
                                    image: UIImage(named: "promosIcon"),
                                    viewController: PromosVC())
        let wallet = self.createNav(title: "Billetera",
                                    image: UIImage(named: "walletIcon"),
                                    viewController: WalletVC())
        let menu = self.createNav(title: "Más", 
                                  image: UIImage(named: "gridIcon"),
                                  viewController: MenuVC())
        
        self.tabBar.isHidden = true
        
        self.setViewControllers([home, promos, wallet, menu], animated: true)
        
        let customTabBar = HomeTabBar(viewController: self)
        
        self.view.addSubview(customTabBar)
        
        NSLayoutConstraint.activate([
            customTabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            customTabBar.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            customTabBar.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            customTabBar.heightAnchor.constraint(equalToConstant: 90),
         ])
        
    }
    
    private func createNav(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: viewController)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
        
    }

}

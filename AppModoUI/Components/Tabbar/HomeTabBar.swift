//
//  HomeTabBar.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 30/01/2024.
//

import UIKit
import CHGlassmorphismView

class HomeTabBar: UIView {
    
    private var viewController: UITabBarController?
    
    init(viewController: UITabBarController){
        super.init(frame: .zero)
        self.viewController = viewController
        self.configure() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func configure() {
        
        self.translatesAutoresizingMaskIntoConstraints = false

        
        guard let viewController = self.viewController else {
            return
        }
                
        let background = UIView()
        background.backgroundColor = .lightGray
        background.alpha = 0.3
        background.translatesAutoresizingMaskIntoConstraints = false
        
        let menuBar = CHGlassmorphismView()
        
        menuBar.setTheme(theme: .light)
        menuBar.setBlurDensity(with: 0.2) // value from 0 to 1 is available (default value is 0.65)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        
        menuBar.layer.cornerRadius = 20
        background.layer.cornerRadius = 20
        
       
        self.addSubview(background)
        self.addSubview(menuBar)
        
        
       NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(equalTo: self.topAnchor),
            menuBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            menuBar.leftAnchor.constraint(equalTo: self.leftAnchor),
            menuBar.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            background.leftAnchor.constraint(equalTo: self.leftAnchor),
            background.rightAnchor.constraint(equalTo: self.rightAnchor),
            
        ])
      
        let iconsContainer = UIStackView()
        iconsContainer.spacing = 20
        iconsContainer.distribution = .fillEqually
        iconsContainer.axis = .horizontal
        iconsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let homeIconContainer = MenuButton(icon: "homeIcon", text: "Inicio", menuName: ViewControllerNames.HOME_VIEW, viewController: viewController, menuIndex: 0)
        let promosIconContainer = MenuButton(icon: "promosIcon", text: "Promos", menuName: ViewControllerNames.PROMOS, viewController: viewController, menuIndex: 1)
        let walletIconContainer = MenuButton(icon: "walletIcon", text: "Billetera", menuName: ViewControllerNames.WALLET, viewController: viewController, menuIndex: 2)
        let menuIconContainer = MenuButton(icon: "gridIcon", text: "Más", menuName: ViewControllerNames.MENU, viewController: viewController, menuIndex: 3)
        
        iconsContainer.addArrangedSubview(homeIconContainer)
        iconsContainer.addArrangedSubview(promosIconContainer)
        iconsContainer.addArrangedSubview(walletIconContainer)
        iconsContainer.addArrangedSubview(menuIconContainer)
        
        menuBar.addSubview(iconsContainer)
        
        
        NSLayoutConstraint.activate([
            iconsContainer.topAnchor.constraint(equalTo: menuBar.topAnchor, constant: 10),
            iconsContainer.bottomAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: -10),
            iconsContainer.leftAnchor.constraint(equalTo: menuBar.leftAnchor, constant: 15),
            iconsContainer.rightAnchor.constraint(equalTo: menuBar.rightAnchor, constant: -15)
        ])
        
    }
    
}

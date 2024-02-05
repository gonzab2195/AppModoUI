//
//  MenuButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 29/01/2024.
//

import UIKit

class MenuButton: UIButton {
    
    private let image = UIImageView()
    private let label = UILabel()
    
    private var menuButton: ViewControllerNames?
    private var icon: String?
    private var viewController: UITabBarController?
    private var menuIndex: Int?
    
    init(icon: String, text: String, menuName menuButton: ViewControllerNames, viewController: UITabBarController, menuIndex: Int){
        super.init(frame: .zero)
        self.menuButton = menuButton
        self.icon = icon
        self.viewController = viewController
        self.menuIndex = menuIndex
        self.configure(text: text)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setMenuStatus), name: Notification.Name(ObserversNames.MENU_BUTTON_UPDATED), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(text: String) {
        
        self.addTarget(self, action: #selector(self.toggleMenu), for: .touchUpInside)
        self.layer.cornerRadius = 20
    
        //Image
        
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .green
        
        self.addSubview(image)
        
        //Label
       
        label.text = text
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            image.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
        ])
        
        setMenuStatus()
    }
    
    @objc private func setMenuStatus(){
        
        let menuSelected =  UsersDefault.getFromUserDefault(key: UsersDefaultsKeys.MENU_SELECTED)
        
        image.image = UIImage(named: icon!)?.withTintColor(menuButton?.rawValue == menuSelected ? UIColor(named: Colors.PAYMENT_DEFAULT)! : .black)
        label.textColor = menuButton?.rawValue == menuSelected ? UIColor(named: Colors.PAYMENT_DEFAULT)! : .black
        self.backgroundColor = menuButton?.rawValue == menuSelected ? .white : .clear

        
    }
    
    @objc func toggleMenu(){
        
        guard let menuIndex = self.menuIndex, let menuButton = self.menuButton else {
            return
        }
        
        UsersDefault.saveToUserDefault(key: UsersDefaultsKeys.MENU_SELECTED, save: menuButton.rawValue)
        
        setMenuStatus()
      
        NotificationCenter.default.post(name: Notification.Name(ObserversNames.MENU_BUTTON_UPDATED), object: nil)
        viewController?.selectedIndex = menuIndex

    }
}

//
//  AccountsCarrouselContainer.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

class AccountsHomeSection: UIView {
    
    
    init(){
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        configureTitleSection()
        configureActionButtons()
    }
    
    func configureTitleSection(){
        let title = HomeTitle(title: "TUS CUENTAS")
        
        self.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    func configureActionButtons(){
        
        let eyeButton = IconButton(image: UIImage(named: "eyeOpenIcon")!)
        let moneyButton = IconButton(image: UIImage(named: "dolarIcon")!)
        
        self.addSubview(eyeButton)
        self.addSubview(moneyButton)
        
        NSLayoutConstraint.activate([
            eyeButton.bottomAnchor.constraint(equalTo: self.topAnchor,
                                           constant: 25),
            eyeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: -20),
            eyeButton.widthAnchor.constraint(equalToConstant: 60),
            eyeButton.heightAnchor.constraint(equalToConstant: 60),
            
            moneyButton.bottomAnchor.constraint(equalTo: self.topAnchor,
                                           constant: 25),
            moneyButton.trailingAnchor.constraint(equalTo: eyeButton.leadingAnchor,
                                                constant: -15),
            moneyButton.widthAnchor.constraint(equalToConstant: 60),
            moneyButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
    }
    
}

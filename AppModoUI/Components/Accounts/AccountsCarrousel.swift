//
//  AccountsCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 21/01/2024.
//

import UIKit

class AccountsCarrousel: UIView {
    
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
        configureCarrousel()
        configureActionButtons()
    }
    
    func configureTitleSection(){
        let title = UILabel()
        
        title.text = "TUS CUENTAS"
        title.textColor = UIColor(named: Colors.SECONDARY_GRAY_40)
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    func configureCarrousel() {
        
        let elementsArray = [
            HomeAccount(),
            HomeAccount(),
            HomeAccount(),
            HomeAccount(),
            HomeAccount(),
            HomeAccount(),
            HomeAccount(),
        ]
        
        let carrouselContainer = HorizontalCarrousel(elementsWidth: 250,
                                                     spaceBetween: 10,
                                                     initialPadding: 20,
                                                     elementsArray: elementsArray)
        
        self.addSubview(carrouselContainer)
        
        NSLayoutConstraint.activate([
            carrouselContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            carrouselContainer.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrouselContainer.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrouselContainer.heightAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    func configureActionButtons(){
        
        let eyeButton = IconButton(imageName: "bell")
        let moneyButton = IconButton(imageName: "bell")
        
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

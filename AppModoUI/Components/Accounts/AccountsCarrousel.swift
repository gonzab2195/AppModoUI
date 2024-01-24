//
//  AccountsCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 21/01/2024.
//

import UIKit

class AccountsCarrousel: UIView {
    
    private var accountsInformation: [AccountInformation]?
    
    init(accountsInformation: [AccountInformation]){
        super.init(frame: .zero)
        self.accountsInformation = accountsInformation
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.configureCarrousel()
    }
    
    private func configureCarrousel() {
        
        var carrouselElements: [UIView] = []
        
        guard let accountsInformation = self.accountsInformation else {
            return
        }

        for account in accountsInformation {
          
            carrouselElements.append(HomeAccount(accountInformation: account))

        }
      
        
        let carrouselContainer = HorizontalCarrousel(elementsWidth: 250,
                                                     spaceBetween: 10,
                                                     initialPadding: 20,
                                                     elementsArray: carrouselElements)
        
        self.addSubview(carrouselContainer)
        
        NSLayoutConstraint.activate([
            carrouselContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            carrouselContainer.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrouselContainer.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrouselContainer.heightAnchor.constraint(equalToConstant: 130)
        ])
        
    }
}

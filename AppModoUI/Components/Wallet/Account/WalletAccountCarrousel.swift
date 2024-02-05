//
//  WalletAccountCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import UIKit

class WalletAccountCarrousel : UIView {
    
    init(){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCarrousel(accounts: [Account]){
        var carrouselElements: [UIView] = []
        var banksAlreadyAdded: [String] = []
        
        for userAccount in accounts {
            if(!banksAlreadyAdded.contains(userAccount.bank.id)){
                let walletCard = WalletAccount(account: userAccount)
                carrouselElements.append(walletCard)
                
                banksAlreadyAdded.append(userAccount.bank.id)
            }
            
        }
        
        let carrousel = Carrousel(carrouselElements: carrouselElements, elementsSize: CGSize(width: self.frame.width, height: 70), spaceBetween: 10, initialPadding: 20, axis: .vertical)
        
        self.addSubview(carrousel)
        
        NSLayoutConstraint.activate([
            carrousel.topAnchor.constraint(equalTo: self.topAnchor),
            carrousel.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrousel.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrousel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}


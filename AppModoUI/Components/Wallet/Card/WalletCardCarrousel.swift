//
//  WalletCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import UIKit

class WalletCardCarrousel : UIView {
    
    init(){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCarrousel(cards: [Card]){
        var carrouselElements: [UIView] = []
        
        for userCard in cards {
            let walletCard = WalletCard(card: userCard)
            carrouselElements.append(walletCard)
        }
        
        let carrousel = Carrousel(carrouselElements: carrouselElements, elementsSize: CGSize(width: self.frame.width, height: 200), spaceBetween: 10, initialPadding: 20, axis: .vertical)
        
        self.addSubview(carrousel)
        
        NSLayoutConstraint.activate([
            carrousel.topAnchor.constraint(equalTo: self.topAnchor),
            carrousel.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrousel.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrousel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}


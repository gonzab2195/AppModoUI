//
//  PromosCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

class PromosCarrousel: UIView {
    
    var promotions: Promotion?
    
    init(promotions: Promotion){
        super.init(frame: .zero)
        self.promotions = promotions
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        configureCarrousel()
    }
    
    func configureCarrousel() {
        
        var carrouselElements: [UIView] = []
        
        guard let promotions = self.promotions else {
            return
        }
        
        for card in promotions.cards {
            
            carrouselElements.append(BannerPromos(bannerImage: card.landscapeApp))

        }
        
        let carrouselContainer = HorizontalCarrousel(elementsWidth: 350,
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

//
//  AccountsCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 21/01/2024.
//

import UIKit

class AccountsCarrousel: UIView {
    
    var carrouselElements: [UIView]?
    
    init(carrouselElements: [UIView]){
        super.init(frame: .zero)
        self.carrouselElements = carrouselElements
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
        
        guard let carrouselElements = self.carrouselElements else {
            return
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

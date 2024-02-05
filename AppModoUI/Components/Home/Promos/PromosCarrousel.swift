//
//  PromosCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

class PromosCarrousel: UIView, HorizontalCarrouselProtocol {
    
    private var promotion: Promotion?
    private var carrouselContainer: Carrousel?

    init(observerName: String, promotion: Promotion){
        super.init(frame: .zero)
        self.promotion = promotion
        self.configure()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updateCarrousel(notification:)),
                                               name: Notification.Name(observerName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func updateCarrousel(notification: Notification){
        if let promotion: Promotion = notification.object as? Promotion {
            
            self.promotion = promotion
            carrouselContainer?.reloadData(carrouselElements: createArray())
            
        }
    }
    
    private func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        carrouselContainer = Carrousel(carrouselElements: createArray(),
                                                     elementsSize: CGSize(width: 350, height: 110),
                                                     spaceBetween: 10,
                                                     initialPadding: 20)
        
        guard let carrouselContainer = self.carrouselContainer else {
            return
        }
        self.addSubview(carrouselContainer)
        
        NSLayoutConstraint.activate([
            carrouselContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            carrouselContainer.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrouselContainer.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrouselContainer.heightAnchor.constraint(equalToConstant: 110)
        ])
        
    }
    
    private func createArray() -> [UIView]{
        
        var carrouselElements: [UIView] = []
        
        guard let promotions = self.promotion else {
            return []
        }
        
        for card in promotions.cards {
            
            carrouselElements.append(BannerPromos(bannerImage: card.landscapeApp))

        }
        
        return carrouselElements
    }
    
}

//
//  PromosCarrouselContainer.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

class PromosHomeSection: UIView {
        
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
    }
    
    func configureTitleSection(){
        let title = HomeTitle(title: "TUS PROMOCIONES")
        self.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
        
}

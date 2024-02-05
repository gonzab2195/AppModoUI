//
//  AddButto.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import UIKit

class AddButton: UIButton {
    
    init(){
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
        self.layer.cornerRadius = 20
        
        let buttonImage = UIImageView()
        
        self.addSubview(buttonImage)
        
        buttonImage.contentMode = .scaleAspectFit
        buttonImage.image = UIImage(named: "plusIcon")
        buttonImage.tintColor = .black
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonImage.topAnchor.constraint(equalTo: self.topAnchor),
            buttonImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
    
    
}

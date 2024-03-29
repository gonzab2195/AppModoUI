//
//  IconButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 20/01/2024.
//

import UIKit

class IconButton: UIButton {
    
    init(image: UIImage){
        super.init(frame: .zero)
        self.configure(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(image: UIImage){
        
        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
        self.layer.cornerRadius = 20
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonImage = UIImageView()
        
        self.addSubview(buttonImage)
        
        buttonImage.contentMode = .scaleAspectFit
        buttonImage.image = image
        buttonImage.tintColor = .black
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            buttonImage.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            buttonImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            buttonImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -15),
        ])
        
    }
    
}

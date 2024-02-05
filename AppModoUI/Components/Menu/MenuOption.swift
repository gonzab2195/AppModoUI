//
//  MenuOption.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import UIKit

class MenuOption: UIView {
    
    private var action: (() -> Void)?
    
    init(image: UIImage, text: String, tintColor: UIColor = .black,
         action: @escaping () -> Void){
        super.init(frame: .zero)
        self.action = action
        
        self.configure(image: image, text: text, tintColor: tintColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(image: UIImage, text: String, tintColor: UIColor){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(menuTapped))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //icon
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = tintColor
        icon.image = image
        icon.clipsToBounds = true
        icon.contentMode = .scaleAspectFit
        
        self.addSubview(icon)
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //title
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = text
        title.textColor = tintColor
        self.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            title.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //chevron
        let chevron = UIImageView()
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.image = UIImage(named: "chevronRight")
        self.addSubview(chevron)
        
        NSLayoutConstraint.activate([
            chevron.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            title.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc private func menuTapped(){
        
        if let action = self.action {
            action()
        }
    }
    
}


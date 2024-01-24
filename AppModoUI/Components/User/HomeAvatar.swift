//
//  HorizontalAvatar.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 20/01/2024.
//

import UIKit

class HomeAvatar: UIView {
    
    private var width: Double?
    private var image: String?
    private var name: String?
    private var nameInitials: String?
    
    init(image: String?, name: String?, nameInitials: String?, width: Double){
        super.init(frame: .zero)
        
        self.width = width
        self.image = image
        self.name = name
        self.nameInitials = nameInitials
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.helloUser()
        
        guard let _ = self.image else {
            self.userInitialCircle()
            return
        }
        
        self.userImageCircle()
    }
    
    private func helloUser(){
        
        let avatarName = UILabel()
        
        self.addSubview(avatarName)
        
        avatarName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarName.topAnchor.constraint(equalTo: self.topAnchor),
            avatarName.rightAnchor.constraint(equalTo: self.rightAnchor),
            avatarName.widthAnchor.constraint(equalToConstant: width! - 75),
            avatarName.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        avatarName.font = UIFont.boldSystemFont(ofSize: 24)
        avatarName.text = "Hola \n\(name ?? "")! 👋"
        avatarName.numberOfLines = 2
    }
    
    private func userInitialCircle(){
        
        guard let nameInitials = self.nameInitials else{
            return
        }
        
        let avatarCircle = UserInitialsCircle(initials: nameInitials)
        
        self.addSubview(avatarCircle)
        
        NSLayoutConstraint.activate([
            avatarCircle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarCircle.leftAnchor.constraint(equalTo: self.leftAnchor),
            avatarCircle.widthAnchor.constraint(
                equalToConstant: 65),
            avatarCircle.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    private func userImageCircle(){
        let avatarImage = UserImageCircle(image: image ?? "")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 80),
            avatarImage.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10)
        ])
    }
    
}

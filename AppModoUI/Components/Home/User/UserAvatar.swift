//
//  HorizontalAvatar.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 20/01/2024.
//

import UIKit

class UserAvatar: UIView {
    
    let avatarName = UILabel()
    
    private var width: Double?
    private var user: User?
    private var profileAvatar = false
    
    init(user: User?, width: Double, profileAvatar: Bool = false){
        super.init(frame: .zero)
        
        self.width = width
        self.user = user
        self.profileAvatar = profileAvatar
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.helloUser()
        
        if profileAvatar {
            self.userPhone()
        }
        
        guard let user = self.user, let _ = user.image else {
            self.userInitialCircle()
            return
        }
        
        self.userImageCircle()
    }
    
    private func userImageCircle(){
        
        guard let user = self.user else{
            return
        }
        
        let avatarImage = UserImageCircle(image: user.image ?? "")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: self.topAnchor),
            avatarImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 80),
            avatarImage.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10)
        ])
    }
    
    private func userInitialCircle(){
        
        guard let user = self.user else{
            return
        }
        
        let avatarCircle = UserInitialsCircle(initials: user.userInitials())
        
        self.addSubview(avatarCircle)
        
        NSLayoutConstraint.activate([
            avatarCircle.topAnchor.constraint(equalTo: self.topAnchor),
            avatarCircle.leftAnchor.constraint(equalTo: self.leftAnchor),
            avatarCircle.widthAnchor.constraint(
                equalToConstant: 65),
            avatarCircle.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    private func helloUser(){
        
        guard let user = self.user else {
            self.userInitialCircle()
            return
        }
        
        self.addSubview(avatarName)
        
        avatarName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarName.topAnchor.constraint(equalTo: self.topAnchor),
            avatarName.rightAnchor.constraint(equalTo: self.rightAnchor),
            avatarName.widthAnchor.constraint(equalToConstant: width! - 75),
            avatarName.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        avatarName.font = UIFont.boldSystemFont(ofSize: 24)
        avatarName.text = profileAvatar ? "\(user.firstName)\n\(user.lastName)"
                                        : "Hola \n\(user.firstName)! 👋"
        avatarName.numberOfLines = 2
    }
    
    private func userPhone(){
        
        guard let user = self.user else {
            self.userInitialCircle()
            return
        }
        
        
        let userPhone = UILabel()
        userPhone.translatesAutoresizingMaskIntoConstraints = false
        userPhone.text = "📱 \(user.phoneNumber)"
        userPhone.font = .systemFont(ofSize: 17)
        
        self.addSubview(userPhone)
        
        NSLayoutConstraint.activate([
            userPhone.leadingAnchor.constraint(equalTo: avatarName.leadingAnchor),
            userPhone.topAnchor.constraint(equalTo: avatarName.bottomAnchor, constant: 3),
            userPhone.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    
    
}

//
//  UserInitialsCircle.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 20/01/2024.
//

import UIKit

class UserInitialsCircle: UIView {
    
    private var initials: String?
    
    init(initials: String){
        super.init(frame: .zero)
        self.initials = initials
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        
        guard let initials = self.initials else {
            return
        }
        
        self.layer.cornerRadius = 32.5
        self.backgroundColor = UIColor(named: Colors.SECONDARY_PAYMENT_10)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let userInitials = UILabel()
        self.addSubview(userInitials)
       
        userInitials.textColor = UIColor(named: Colors.PAYMENT_DARK)
        userInitials.text = initials
        userInitials.font = UIFont.boldSystemFont(ofSize: 20)
        userInitials.textAlignment = .center
        userInitials.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInitials.topAnchor.constraint(equalTo: self.topAnchor),
            userInitials.leftAnchor.constraint(equalTo: self.leftAnchor),
            userInitials.rightAnchor.constraint(equalTo: self.rightAnchor),
            userInitials.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}

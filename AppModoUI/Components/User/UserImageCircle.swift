//
//  UserImage.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 20/01/2024.
//

import UIKit

class UserImageCircle: UIImageView {
    
    init(){
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        self.image = UIImage(systemName: "user")
        self.contentMode = .scaleAspectFit
        self.layer.cornerRadius = 40
        self.tintColor = .black
    }
}

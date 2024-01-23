//
//  UserImage.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 20/01/2024.
//

import UIKit

class UserImageCircle: UIImageView {
    
    init(image: String){
        super.init(frame: .zero)
        configure(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: String){
        self.image = UIImage(systemName: "user")
        self.contentMode = .scaleAspectFit
        self.layer.cornerRadius = 40
        self.tintColor = .black
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

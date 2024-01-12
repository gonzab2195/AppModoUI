//
//  LoginMainActionButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class LoginMainActionButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        configure()
        self.setTitle(title, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 19)
        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
    }
    
   
}

//
//  AccountBank.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 24/01/2024.
//

import UIKit

class AccountBank: UIView {
    
    private var logo: String = ""
    private var name: String = ""
    
    init(logo: String, name: String){
        super.init(frame: .zero)
        self.logo = logo
        self.name = name
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let bankLogo = UIImageView()
        bankLogo.imageFrom(url: URL(string: logo)!)
        bankLogo.contentMode = .scaleAspectFit
        bankLogo.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bankLogo)
        
        bankLogo.layer.cornerRadius = 12.5
        bankLogo.layer.masksToBounds = true
        
        let bankName = UILabel()
        bankName.text = name
        bankName.font = .systemFont(ofSize: 15, weight: .semibold)
        bankName.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bankName)
        
        NSLayoutConstraint.activate([
            bankLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bankLogo.topAnchor.constraint(equalTo: self.topAnchor),
            bankLogo.widthAnchor.constraint(equalToConstant: 30),
            bankLogo.heightAnchor.constraint(equalToConstant: 30),
            
            bankName.leadingAnchor.constraint(equalTo: bankLogo.trailingAnchor, constant: 5),
            bankName.bottomAnchor.constraint(equalTo: bankLogo.bottomAnchor, constant: -5),
            bankName.widthAnchor.constraint(equalToConstant: 100),
        ])
        
       
        
    }
}

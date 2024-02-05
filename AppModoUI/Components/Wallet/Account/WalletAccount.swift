//
//  WalletAccount.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import UIKit

class WalletAccount: UIView {
    
    init(account: Account){
        super.init(frame: .zero)
        self.configure(account: account)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(account: Account){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
        self.layer.cornerRadius = 20
        
        
        let bankLogo = UIImageView()
        bankLogo.translatesAutoresizingMaskIntoConstraints = false
        bankLogo.imageFrom(url: URL(string: account.bank.imageUrl)!)
        
        self.addSubview(bankLogo)
        
        NSLayoutConstraint.activate([
            bankLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bankLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            bankLogo.widthAnchor.constraint(equalToConstant: 40),
            bankLogo.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let bankName = UILabel()
        bankName.translatesAutoresizingMaskIntoConstraints = false
        bankName.text = account.bank.name
        bankName.font = .systemFont(ofSize: 15, weight: .semibold)
        self.addSubview(bankName)
        
        NSLayoutConstraint.activate([
            bankName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bankName.leadingAnchor.constraint(equalTo: bankLogo.trailingAnchor, constant: 5),
            bankName.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let chevron = UIImageView()
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.image = UIImage(named: "chevronRight")!
        chevron.tintColor = .red//UIColor(named: Colors.SECONDARY_GRAY_40)
        chevron.clipsToBounds = true
        
        self.addSubview(chevron)
        
        NSLayoutConstraint.activate([
            chevron.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            chevron.widthAnchor.constraint(equalToConstant: 35),
            chevron.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}

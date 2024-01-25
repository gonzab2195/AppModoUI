//
//  AccountCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 21/01/2024.
//

import UIKit

class HomeAccount: UIView {
    
    private var accountInformation: AccountInformation?
    
    init(accountInformation: AccountInformation){
        super.init(frame: .zero)
        self.accountInformation = accountInformation
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        guard let accountInformation = self.accountInformation else{
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
        self.layer.cornerRadius = 25
        self.layer.borderColor = UIColor(named: Colors.SECONDARY_GRAY_8)?.cgColor
        self.layer.borderWidth = 1
        
        let container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .vertical
        container.spacing = 10
        container.distribution = .equalSpacing
        
        self.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            container.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            container.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        
        //Bank
        
        let bankLogo = AccountBank(logo: accountInformation.bankLogo, name: accountInformation.bankName)
        
        //Acount Balance
        
        let accountBalance = AccountBalance(balance: accountInformation.accountBalance)
        
        
        //Acount Info
        let accountInfo = UILabel()
        
        accountInfo.font = .systemFont(ofSize: 13, weight: .regular)
        accountInfo.text = "\(accountInformation.accountType == "SAVINGS" ? "CA" : "CC") ∙ \(accountInformation.accountLastDigits)"
        accountInfo.translatesAutoresizingMaskIntoConstraints = false
        
        container.addArrangedSubview(bankLogo)
        container.addArrangedSubview(accountBalance)
        container.addArrangedSubview(accountInfo)
    }
    
}

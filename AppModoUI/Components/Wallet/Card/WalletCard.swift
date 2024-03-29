//
//  WalletCard.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 02/02/2024.
//

import UIKit
import SVGKit

class WalletCard: UIImageView {
    
    init(card: Card) {
        super.init(frame: .zero)
       
        
        self.configure(card : card)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(card: Card){
        
        guard let bankURL = URL(string: card.bankLogo), let issuerURL = URL(string: card.issuerLogo) else {
            return
        }
        
        self.imageFrom(url: URL(string: card.issuerBackgroundLogo)!)
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor.colorFromHex(hex: card.cardColor)
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        //Bank Logo
        
        let banks = ["Reba", "BIND"]
        
        if !banks.contains(card.bank.name) {
            let bankLogo = UIImageView()
            bankLogo.translatesAutoresizingMaskIntoConstraints = false
            bankLogo.loadSVG(bankURL, card: card.lastDigits)
            
            self.addSubview(bankLogo)
            
            NSLayoutConstraint.activate([
                bankLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
                bankLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
                bankLogo.widthAnchor.constraint(equalToConstant: 150),
                bankLogo.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        let issueLogo = UIImageView()
        issueLogo.loadSVG(issuerURL, card: card.lastDigits)
        issueLogo.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(issueLogo)
        
        NSLayoutConstraint.activate([
            issueLogo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -35),
            issueLogo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            issueLogo.widthAnchor.constraint(equalToConstant: 70),
            issueLogo.heightAnchor.constraint(equalToConstant: 40)
        ])
       
        
        
        //Last Digits
        
        let lastDigits = UILabel()
        lastDigits.translatesAutoresizingMaskIntoConstraints = false
        lastDigits.text = "• • • \(card.lastDigits)"
        lastDigits.textColor = .white
        lastDigits.font = .systemFont(ofSize: 13, weight: .bold)
        
        self.addSubview(lastDigits)
        
        NSLayoutConstraint.activate([
            lastDigits.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            lastDigits.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15),
            lastDigits.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        //Expire
        
        let expireDate = UILabel()
        expireDate.translatesAutoresizingMaskIntoConstraints = false
        expireDate.text = "Vence \(card.expiry)"
        expireDate.textColor = .white
        expireDate.font = .systemFont(ofSize: 13, weight: .bold)
        
        self.addSubview(expireDate)
        
        NSLayoutConstraint.activate([
            expireDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            expireDate.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            expireDate.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        //card type
        
        let cardType = UILabel()
        cardType.translatesAutoresizingMaskIntoConstraints = false
        cardType.text = card.type == "CREDIT" ? "Crédito" : "Débito"
        cardType.textColor = .white
        cardType.font = .systemFont(ofSize: 13, weight: .bold)
        
        self.addSubview(cardType)
        
        NSLayoutConstraint.activate([
            cardType.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            cardType.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            cardType.heightAnchor.constraint(equalToConstant: 20)
        ])

    }
    
}

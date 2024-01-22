//
//  AccountCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 21/01/2024.
//

import UIKit

class HomeAccount: UIView {
    
    var account: Account?
    
    init(account: Account){
        super.init(frame: .zero)
        self.account = account
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        guard let account = self.account else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
        self.layer.cornerRadius = 25
        self.layer.borderColor = UIColor(named: Colors.SECONDARY_GRAY_8)?.cgColor
        self.layer.borderWidth = 1
        
        //Bank
        let bankLogoImageView = UIImageView()
        bankLogoImageView.imageFrom(url: URL(string: account.bank.imageUrl)!)
        bankLogoImageView.contentMode = .scaleAspectFit
        bankLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bankLogoImageView)
        
        NSLayoutConstraint.activate([
            bankLogoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bankLogoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            bankLogoImageView.widthAnchor.constraint(equalToConstant: 30),
            bankLogoImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        bankLogoImageView.layer.cornerRadius = 12.5
        bankLogoImageView.layer.masksToBounds = true
        
        let bankName = UILabel()
        bankName.text = account.bank.name
        bankName.font = .systemFont(ofSize: 15, weight: .semibold)
        bankName.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bankName)
        
        NSLayoutConstraint.activate([
            bankName.leadingAnchor.constraint(equalTo: bankLogoImageView.trailingAnchor, constant: 5),
            bankName.topAnchor.constraint(equalTo: self.topAnchor, constant: 26),
            bankName.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        //Amount
        let currency = UILabel()
        
        currency.font = .systemFont(ofSize: 19, weight: .semibold)
        currency.text = "$"
        currency.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(currency)
        
        let roundedAmount = UILabel()
        roundedAmount.font = .systemFont(ofSize: 23, weight: .semibold)
        roundedAmount.text = "3112,"
        roundedAmount.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(roundedAmount)
        
        let decimalsAmount = UILabel()
        decimalsAmount.font = .systemFont(ofSize: 18, weight: .semibold)
        decimalsAmount.text = "54"
        decimalsAmount.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(decimalsAmount)
        
        NSLayoutConstraint.activate([
            roundedAmount.topAnchor.constraint(equalTo: bankLogoImageView.topAnchor, constant: 40),
            roundedAmount.leadingAnchor.constraint(equalTo: currency.trailingAnchor, constant: 3),
            
            currency.topAnchor.constraint(equalTo: roundedAmount.topAnchor, constant: 2),
            currency.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            decimalsAmount.topAnchor.constraint(equalTo: bankLogoImageView.topAnchor, constant: 40),
            decimalsAmount.leadingAnchor.constraint(equalTo: roundedAmount.trailingAnchor),
            decimalsAmount.bottomAnchor.constraint(equalTo: roundedAmount.bottomAnchor, constant: 5)
        ])
        
        let accountInfo = UILabel()
        
        accountInfo.font = .systemFont(ofSize: 13, weight: .regular)
        accountInfo.text = "\(account.type == "SAVINGS" ? "CA" : "CC") ∙ \(account.lastDigits)"
        accountInfo.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(accountInfo)
        
        NSLayoutConstraint.activate([
            accountInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            accountInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
}

//
//  AccountBalance.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 24/01/2024.
//

import UIKit

class AccountBalance: UIView {
    
    private var balance: Float?
    
    init(balance: Float?){
        super.init(frame: .zero)
        self.balance = balance
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        guard let balance = self.balance else {
            return
        }
        
        formattedBalances(balance: balance)
        
    }
    
    private func formattedBalances(balance: Float){
        let currency = UILabel()
        
        currency.font = .systemFont(ofSize: 19, weight: .semibold)
        currency.text = "$"
        currency.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(currency)
        
        let roundedAmount = UILabel()
        roundedAmount.font = .systemFont(ofSize: 23, weight: .semibold)
        roundedAmount.text = "\(getRoundedAmount(balance)),"
        roundedAmount.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(roundedAmount)
        
        let decimalsAmount = UILabel()
        decimalsAmount.font = .systemFont(ofSize: 18, weight: .semibold)
        decimalsAmount.text = getDecimalAmount(balance)
        decimalsAmount.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(decimalsAmount)
        
        NSLayoutConstraint.activate([
            roundedAmount.topAnchor.constraint(equalTo: self.topAnchor),
            roundedAmount.leadingAnchor.constraint(equalTo: currency.trailingAnchor, constant: 3),
            
            currency.topAnchor.constraint(equalTo: roundedAmount.topAnchor),
            currency.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            decimalsAmount.topAnchor.constraint(equalTo: self.topAnchor),
            decimalsAmount.leadingAnchor.constraint(equalTo: roundedAmount.trailingAnchor),
            decimalsAmount.bottomAnchor.constraint(equalTo: roundedAmount.bottomAnchor, constant: 5)
        ])
    }
}

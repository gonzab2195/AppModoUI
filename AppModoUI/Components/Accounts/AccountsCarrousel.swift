//
//  AccountsCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 21/01/2024.
//

import UIKit

class AccountsCarrousel: UIView, HorizontalCarrouselProtocol {
    
    private var accountsInformation: [AccountInformation]?
    private var carrouselContainer: HorizontalCarrousel?
    
    init(observerName: String, accountsInformation: [AccountInformation]){
        super.init(frame: .zero)
        self.accountsInformation = accountsInformation
        self.configure(observerName: observerName)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updateCarrousel(notification:)),
                                               name: Notification.Name(observerName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func updateCarrousel(notification: Notification){
        if let accountsInformation: [AccountInformation] = notification.object as? [AccountInformation] {
            self.accountsInformation = accountsInformation
            carrouselContainer?.reloadData(carrouselElements: createArray())
        }
    }
    
    private func configure(observerName: String){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        carrouselContainer = HorizontalCarrousel(carrouselElements: createArray(),
                                                 elementsSize: CGSize(width: 250, height: 130),
                                                 spaceBetween: 10,
                                                 initialPadding: 20)
        
        guard let carrouselContainer = self.carrouselContainer else {
            return
        }
        
        self.addSubview(carrouselContainer)
        
        NSLayoutConstraint.activate([
            carrouselContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            carrouselContainer.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrouselContainer.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrouselContainer.heightAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    private func createArray() -> [UIView] {
        var carrouselElements: [UIView] = []
        
        guard let accountsInformation = self.accountsInformation else {
            return []
        }

        for account in accountsInformation {
          
            carrouselElements.append(HomeAccount(accountInformation: account))

        }
        
        return carrouselElements
    }
}

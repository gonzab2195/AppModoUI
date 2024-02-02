//
//  WalletTabBar.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 01/02/2024.
//

import UIKit

protocol WalletTabBarProtocol {
    
    func selectedTab(tabText: String)
    
}

class WalletTabBar: UIStackView, WalletTabBarProtocol {
    
    private var selectedTab: String = ""
    
    var delegate: WalletTabBarProtocol?
    
    init(tabs: [String]) {
        super.init(frame: .zero)
        
        self.configure(tabs: tabs)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(tabs: [String]){
     
      self.translatesAutoresizingMaskIntoConstraints = false
      self.spacing = 5
      self.distribution = .fillEqually
      self.axis = .horizontal
        
     
        
      for (index, tab) in tabs.enumerated() {
        
             if index == 0 {
                selectedTab = tab
             }
                
             let tabItem = WalletTabButton(tabText: tab, isSelectedTab: index == 0)
             tabItem.delegate = self
              
             self.addArrangedSubview(tabItem)
        }
    }
    
    //Delegate
    
    func selectedTab(tabText: String) {
        selectedTab = tabText
        self.delegate?.selectedTab(tabText: tabText)
        for subview in self.arrangedSubviews {
            
            if let walletTabButton = subview as? WalletTabButton {
                walletTabButton.updateTabStatus(tabSelected : selectedTab)
            }
            
        }
        
    }
    
}

//
//  Wallet.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 29/01/2024.
//

import UIKit

class WalletVC: ViewManager, WalletTabBarProtocol {
  
    private let titleLabel = UILabel()
    private let tabsContainer = WalletTabBar(tabs: WalletPresenter.walletTabs)
    private let cardsView = UIView()
    private let accountsView = UIView()
    
    private var selectedTab: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        Navigation.hideNavigationBar(view: self)
        
        self.configureTitle()
        self.configureTabBar()
        self.configureContent()
       
    }
    
    private func configureTitle(){
        titleLabel.text = WalletPresenter.walletTitle
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.70),
        ])
    }
    
    private func configureTabBar(){
        tabsContainer.delegate = self
        self.view.addSubview(tabsContainer)
        
        NSLayoutConstraint.activate([
            tabsContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            tabsContainer.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            tabsContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2),
            tabsContainer.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
    
    private func configureContent(){
        
       
        cardsView.translatesAutoresizingMaskIntoConstraints = false
        cardsView.backgroundColor = .red
        
        self.view.addSubview(cardsView)
        
        NSLayoutConstraint.activate([
            cardsView.topAnchor.constraint(equalTo: tabsContainer.bottomAnchor, constant: 20),
            cardsView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            cardsView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            cardsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
       
        accountsView.translatesAutoresizingMaskIntoConstraints = false
        accountsView.backgroundColor = .blue
        
        self.view.addSubview(accountsView)
        
        NSLayoutConstraint.activate([
            accountsView.topAnchor.constraint(equalTo: tabsContainer.bottomAnchor, constant: 20),
            accountsView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            accountsView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            accountsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        accountsView.isHidden = true
        
    }
    
    //Delegate
    func selectedTab(tabText: String) {
        selectedTab = tabText
        
        if(tabText == WalletPresenter.CARDS_TAB) {
            cardsView.isHidden = false
            accountsView.isHidden = true
        } else{
            accountsView.isHidden = false
            cardsView.isHidden = true
        }
    }

}

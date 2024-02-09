//
//  Wallet.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 29/01/2024.
//

import UIKit

class WalletVC: ViewManagerVC, WalletTabBarProtocol {
    
    private let presenter = WalletPresenter()
  
    private let titleLabel = UILabel()
    private var tabsContainer: WalletTabBar?
    private let cardsCarrousel = WalletCardCarrousel()
    private let accountsCarrousel = WalletAccountCarrousel()
    
    private var selectedTab: String = ""
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let accounts = presenter.getUserAccounts()
        let cards = presenter.getUserCards()
        
        accountsCarrousel.createCarrousel(accounts: accounts)
        cardsCarrousel.createCarrousel(cards: cards)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTitle()
        self.configureTabBar()
        self.configureContent()
       
    }
    
    private func configureTitle(){
        
        titleLabel.text = presenter.walletTitle
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.70),
        ])
        
        let button = AddButton()
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    private func configureTabBar(){
        tabsContainer = WalletTabBar(tabs: presenter.walletTabs)
        
        guard let tabsContainer = self.tabsContainer else {
            return
        }
        
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
        
        guard let tabsContainer = self.tabsContainer else {
            return
        }
                
        accountsCarrousel.translatesAutoresizingMaskIntoConstraints = false
        accountsCarrousel.backgroundColor = .blue
        accountsCarrousel.isHidden = true

        self.view.addSubview(cardsCarrousel)
        self.view.addSubview(accountsCarrousel)
        
        NSLayoutConstraint.activate([
            cardsCarrousel.topAnchor.constraint(equalTo: tabsContainer.bottomAnchor, constant: 20),
            cardsCarrousel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            cardsCarrousel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            cardsCarrousel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            accountsCarrousel.topAnchor.constraint(equalTo: tabsContainer.bottomAnchor, constant: 20),
            accountsCarrousel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            accountsCarrousel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            accountsCarrousel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
       
        
    }
    
    //Delegate
    func selectedTab(tabText: String) {
        
        selectedTab = tabText
        
        if(tabText == WalletPresenter.CARDS_TAB) {
            cardsCarrousel.isHidden = false
            accountsCarrousel.isHidden = true
        } else{
            accountsCarrousel.isHidden = false
            cardsCarrousel.isHidden = true
        }
    }

}

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
        
        cardsView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        
        let cards = presenter.getUserCards()
        var carrouselElements: [UIView] = []
        
        for userCard in cards {
            let walletCard = WalletCard(card: userCard)
            carrouselElements.append(walletCard)
        }
        
        let carrousel = Carrousel(carrouselElements: carrouselElements, elementsSize: CGSize(width: cardsView.frame.width, height: 200), spaceBetween: 10, initialPadding: 20, axis: .vertical)
        
        cardsView.addSubview(carrousel)
        
        NSLayoutConstraint.activate([
            carrousel.topAnchor.constraint(equalTo: cardsView.topAnchor),
            carrousel.leftAnchor.constraint(equalTo: cardsView.leftAnchor),
            carrousel.rightAnchor.constraint(equalTo: cardsView.rightAnchor),
            carrousel.bottomAnchor.constraint(equalTo: cardsView.bottomAnchor)
        ])
        
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

//
//  HomeVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 16/01/2024.
//

import UIKit

class HomeVC: ViewManagerVC, HomePresenterProtocol {
    
    //Presenter
    private var homePresenter: HomePresenter?
    
    private let scrollView = UIScrollView()
    private let scrollViewContent = UIView()
    private var avatarView: UserAvatar?
    //Accounts
    private let accountsHomeSection = AccountsHomeSection()
    private var accountsCarrousel: AccountsCarrousel?
    private var mainButtonRow: UIStackView?
    private var secondaryButtonRow: UIStackView?
    
    //Promos
    private let promosHomeSection = PromosHomeSection()
    
    //Pull to refresh
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        homePresenter = HomePresenter(view: self)
        Navigation.hideNavigationBar(view: self)
        self.configureScrollView()
        self.configure()
    }
    
    @objc private func configure(){
     
        self.configureUserAvatar()
        self.configureNotificationButton()
        self.homePresenter!.configureAccountsCarrousel()
        self.configureCenterButtons()
        self.homePresenter!.configurePromotionsCarrousel()
        
        refreshControl.endRefreshing()
    }
    
    private func configureScrollView(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContent)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewContent.translatesAutoresizingMaskIntoConstraints = false

        let scrollViewContentHeightAnchor = scrollViewContent.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.1)

        scrollViewContentHeightAnchor.isActive = true
        scrollViewContentHeightAnchor.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        refreshControl.addTarget(self, action: #selector(self.configure), for: .valueChanged)
        
        scrollView.addSubview(refreshControl)
    }
    
    private func configureUserAvatar(){
        
        let viewWidth = Double(view.frame.width / 1.5);
        
        avatarView = UserAvatar(user: homePresenter?.getUser(),
                                width: viewWidth)
        
        
        scrollView.addSubview(avatarView!)
        
        NSLayoutConstraint.activate([
            avatarView!.topAnchor.constraint(
                equalTo: scrollViewContent.topAnchor),
            avatarView!.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor,
                                             constant: 20),
            avatarView!.widthAnchor.constraint(equalToConstant: viewWidth),
            avatarView!.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
    }
    
    private func configureNotificationButton(){
            
        let notificationButton = IconButton(image: UIImage(named: "bellIcon")!)
        
        scrollViewContent.addSubview(notificationButton)
        
        
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: scrollViewContent.topAnchor, constant: 12),
            notificationButton.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            notificationButton.widthAnchor.constraint(equalToConstant: 60),
            notificationButton.heightAnchor.constraint(equalToConstant: 60),
        ])
       
    }
    
    private func configureCenterButtons(){
            
        let scanQrButton = ButtonWithImage(buttonColor: UIColor(named: Colors.PAYMENT_DEFAULT)!, title: "Pagar", textColor: .white, fontSize: 19, image: UIImage(named: "qrIcon")!)
        let sendButton = ButtonWithImage(buttonColor: UIColor(named: Colors.SEND_DEFAULT)!, title: "Enviar", textColor: .white, fontSize: 19, image: UIImage(named: "arrowUp")!)


        mainButtonRow = UIStackView(arrangedSubviews: [sendButton, scanQrButton])
        
        guard let mainButtonRow = self.mainButtonRow else {
            return
        }
        
        mainButtonRow.translatesAutoresizingMaskIntoConstraints = false
        mainButtonRow.axis = .horizontal
        mainButtonRow.spacing = 10
        mainButtonRow.distribution = .fillEqually

        scrollViewContent.addSubview(mainButtonRow)
        
        NSLayoutConstraint.activate([
            mainButtonRow.topAnchor.constraint(equalTo: accountsHomeSection.bottomAnchor, constant: 10),
            mainButtonRow.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor, constant: 20),
            mainButtonRow.rightAnchor.constraint(equalTo: scrollViewContent.rightAnchor, constant: -20),
            mainButtonRow.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        let askButton = ButtonWithImage(buttonColor: .white, title: "Pedir", textColor: .black, fontSize: 14, image: UIImage(named: "clipIcon")!, borderColor: UIColor(named: Colors.PAYMENT_DEFAULT)!)
        let gamesButton = ButtonWithImage(buttonColor: .white, title: "Videojuegos", textColor: .black, fontSize: 14, image: UIImage(named: "controllerIcon")!, borderColor: UIColor(named: Colors.PAYMENT_DEFAULT)!)
        let rechargeButton = ButtonWithImage(buttonColor: .white, title: "Recargas", textColor: .black, fontSize: 14, image: UIImage(named: "rechargeIcon")!, borderColor: UIColor(named: Colors.PAYMENT_DEFAULT)!)
        
        secondaryButtonRow = UIStackView(arrangedSubviews: [askButton, gamesButton, rechargeButton])
        
        guard let secondaryButtonRow = self.secondaryButtonRow else {
            return
        }
        
        secondaryButtonRow.translatesAutoresizingMaskIntoConstraints = false
        secondaryButtonRow.axis = .horizontal
        secondaryButtonRow.spacing = 10
        secondaryButtonRow.distribution = .fillProportionally

        scrollViewContent.addSubview(secondaryButtonRow)
        
        NSLayoutConstraint.activate([
            secondaryButtonRow.topAnchor.constraint(equalTo: mainButtonRow.bottomAnchor, constant: 10),
            secondaryButtonRow.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor, constant: 20),
            secondaryButtonRow.rightAnchor.constraint(equalTo: scrollViewContent.rightAnchor, constant: -20),
            secondaryButtonRow.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    //From Presenter
    
    func createAccountsCarrousel(observerName: String, accountsInformation: [AccountInformation]){
        
        scrollViewContent.addSubview(accountsHomeSection)
        
        NSLayoutConstraint.activate([
            accountsHomeSection.topAnchor.constraint(equalTo: avatarView!.bottomAnchor, constant: 40),
            accountsHomeSection.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor),
            accountsHomeSection.rightAnchor.constraint(equalTo: scrollViewContent.rightAnchor),
            accountsHomeSection.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        accountsCarrousel = AccountsCarrousel(observerName: observerName, accountsInformation: accountsInformation)
        
        guard let accountsCarrousel = self.accountsCarrousel else {
            return
        }
        
        scrollViewContent.addSubview(accountsCarrousel)
                
        NSLayoutConstraint.activate([
            accountsCarrousel.bottomAnchor.constraint(equalTo: accountsHomeSection.bottomAnchor),
            accountsCarrousel.leftAnchor.constraint(equalTo: accountsHomeSection.leftAnchor),
            accountsCarrousel.rightAnchor.constraint(equalTo: accountsHomeSection.rightAnchor),
            accountsCarrousel.heightAnchor.constraint(equalToConstant: 130)
        ])
       
    }
    
    func createPromosCarrousel(observerName: String, promotions: Promotion){
        
        scrollViewContent.addSubview(promosHomeSection)
        
        NSLayoutConstraint.activate([
            promosHomeSection.topAnchor.constraint(equalTo: secondaryButtonRow!.bottomAnchor, constant: 10),
            promosHomeSection.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor),
            promosHomeSection.rightAnchor.constraint(equalTo: scrollViewContent.rightAnchor),
            promosHomeSection.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        let promotionsCarrousel = PromosCarrousel(observerName: observerName, promotion: promotions)
        scrollViewContent.addSubview(promotionsCarrousel)
        
        NSLayoutConstraint.activate([
            promotionsCarrousel.bottomAnchor.constraint(equalTo: promosHomeSection.bottomAnchor),
            promotionsCarrousel.leftAnchor.constraint(equalTo: promosHomeSection.leftAnchor),
            promotionsCarrousel.rightAnchor.constraint(equalTo: promosHomeSection.rightAnchor),
            promotionsCarrousel.heightAnchor.constraint(equalToConstant: 110),
        ])
       
    }
}

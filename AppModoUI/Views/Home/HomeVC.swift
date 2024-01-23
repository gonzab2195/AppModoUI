//
//  HomeVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 16/01/2024.
//

import UIKit

class HomeVC: ViewManager, HomePresenterProtocol {
    
    //Presenter
    private var homePresenter: HomePresenter?
    
    private let scrollView = UIScrollView()
    private let scrollViewContent = UIView()
    private var avatarView: HomeAvatar?
    private let accountsCarrouselContainer = AccountsHomeSection()
    private var mainButtonRow: UIStackView?
    private var secondaryButtonRow: UIStackView?
    private let promosCarrouselContainer = PromosHomeSection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePresenter = HomePresenter(view: self)
        
        Navigation.hideNavigationBar(view: self)
       
        configureScrollView()
        configureUserAvatar()
        configureNotificationButton()
        configureAccountsCarrouselContainer()
        configureCenterButtons()
        configurePromotionsCarrousel()
      
        homePresenter!.configureAccountsCarrousel()
        homePresenter!.configurePromotionsCarrousel()
    }
    
    func configureScrollView(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContent)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewContent.translatesAutoresizingMaskIntoConstraints = false

        let scrollViewContentHeightAnchor = scrollViewContent.heightAnchor.constraint(equalTo: scrollView.heightAnchor)

        scrollViewContentHeightAnchor.isActive = true
        scrollViewContentHeightAnchor.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    func configureUserAvatar(){
        
        let viewWidth = Double(view.frame.width / 1.5);
        
        avatarView = HomeAvatar(image: homePresenter!.user.image,
                                name:  homePresenter!.user.firstName,
                                nameInitials: homePresenter!.user.userInitials(),
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
    
    func configureNotificationButton(){
            
        let notificationButton = IconButton(image: UIImage(named: "bellIcon")!)
        
        scrollViewContent.addSubview(notificationButton)
        
        
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: scrollViewContent.topAnchor, constant: 12),
            notificationButton.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            notificationButton.widthAnchor.constraint(equalToConstant: 60),
            notificationButton.heightAnchor.constraint(equalToConstant: 60),
        ])
       
    }
    
    func configureAccountsCarrouselContainer(){
        
        accountsCarrouselContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContent.addSubview(accountsCarrouselContainer)
        
        NSLayoutConstraint.activate([
            accountsCarrouselContainer.topAnchor.constraint(equalTo: avatarView!.bottomAnchor, constant: 40),
            accountsCarrouselContainer.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor),
            accountsCarrouselContainer.rightAnchor.constraint(equalTo: scrollViewContent.rightAnchor),
            accountsCarrouselContainer.heightAnchor.constraint(equalToConstant: 170)
        ])
        
    }
    
    func configureCenterButtons(){
            
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
            mainButtonRow.topAnchor.constraint(equalTo: accountsCarrouselContainer.bottomAnchor, constant: 20),
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
    
    func configurePromotionsCarrousel(){
       
        scrollViewContent.addSubview(promosCarrouselContainer)
        
        NSLayoutConstraint.activate([
            promosCarrouselContainer.topAnchor.constraint(equalTo: secondaryButtonRow!.bottomAnchor, constant: 10),
            promosCarrouselContainer.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor),
            promosCarrouselContainer.rightAnchor.constraint(equalTo: scrollViewContent.rightAnchor),
            promosCarrouselContainer.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    //From Presenter
    
    func createAccountsCarrousel(accountsInformation: [AccountInformation]){
        

        var carrouselElements: [UIView] = []

        for account in accountsInformation {
          
            carrouselElements.append(HomeAccount(accountInformation: account))

        }
        
        let accountsCarrousel = AccountsCarrousel(carrouselElements: carrouselElements)
        
        scrollViewContent.addSubview(accountsCarrousel)
                
        NSLayoutConstraint.activate([
            accountsCarrousel.bottomAnchor.constraint(equalTo: accountsCarrouselContainer.bottomAnchor),
            accountsCarrousel.leftAnchor.constraint(equalTo: accountsCarrouselContainer.leftAnchor),
            accountsCarrousel.rightAnchor.constraint(equalTo: accountsCarrouselContainer.rightAnchor),
            accountsCarrousel.heightAnchor.constraint(equalToConstant: 130)
        ])
       
    }
    
    func createPromosCarrousel(promotions: Promotion){
        

        var carrouselElements: [UIView] = []
        print(promotions.cards.count)
        for card in promotions.cards {
            
            carrouselElements.append(BannerPromos(bannerImage: card.content.image.primaryImage))

        }
        
        let promotionsCarrousel = PromosCarrousel(carrouselElements: carrouselElements)
        
        scrollViewContent.addSubview(promotionsCarrousel)
                
        NSLayoutConstraint.activate([
            promotionsCarrousel.bottomAnchor.constraint(equalTo: promosCarrouselContainer.bottomAnchor),
            promotionsCarrousel.leftAnchor.constraint(equalTo: promosCarrouselContainer.leftAnchor),
            promotionsCarrousel.rightAnchor.constraint(equalTo: promosCarrouselContainer.rightAnchor),
            promotionsCarrousel.heightAnchor.constraint(equalToConstant: 150)
        ])
       
    }
}

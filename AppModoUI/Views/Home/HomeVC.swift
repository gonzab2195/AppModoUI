//
//  HomeVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 16/01/2024.
//

import UIKit

class HomeVC: ViewManager {
    
    private let user = User.getUserFromKeychain()!
    
    private let scrollView = UIScrollView()
    private let scrollViewContent = UIView()
    private var avatarView: HomeAvatar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Navigation.hideNavigationBar(view: self)
       
        configureScrollView()
        configureUserAvatar()
        configureNotificationButton()
        configureAccountsCarrousel()
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
        
        avatarView = HomeAvatar(image: user.image,
                                name: user.firstName,
                                nameInitials: user.userInitials(),
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
            
        let notificationButton = IconButton(imageName: "bell")
        
        scrollViewContent.addSubview(notificationButton)
        
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: scrollViewContent.topAnchor, constant: 12),
            notificationButton.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            notificationButton.widthAnchor.constraint(equalToConstant: 60),
            notificationButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func configureAccountsCarrousel(){
        
        let accountsCarrousel = AccountsCarrousel()
        scrollViewContent.addSubview(accountsCarrousel)
        
        NSLayoutConstraint.activate([
            accountsCarrousel.topAnchor.constraint(equalTo: avatarView!.bottomAnchor, constant: 40),
            accountsCarrousel.leftAnchor.constraint(equalTo: scrollViewContent.leftAnchor),
            accountsCarrousel.rightAnchor.constraint(equalTo: scrollViewContent.rightAnchor),
            accountsCarrousel.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
}

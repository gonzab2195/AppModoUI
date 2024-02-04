//
//  HomeTabPresenter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 02/02/2024.
//

import UIKit

class HomeTabPresenter {
    
    let homeTabs : [Tab] = [
        Tab(title: "Inicio",
            image: UIImage(named: "homeIcon"),
            viewController: HomeVC()),
        Tab(title: "Promos",
            image: UIImage(named: "promosIcon"),
            viewController: PromosVC()),
        Tab(title: "Billetera",
            image: UIImage(named: "walletIcon"),
            viewController: WalletVC()),
        Tab(title: "Más",
            image: UIImage(named: "gridIcon"),
            viewController: MenuVC())
    ]
    
}

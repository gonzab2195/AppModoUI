//
//  WalletPresenter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 01/02/2024.
//

import Foundation

class WalletPresenter {
    
    public static let CARDS_TAB = "TARJETAS"
    public static let ACCOUNTS_TAB = "CUENTAS"
    
    public let walletTabs = [CARDS_TAB, ACCOUNTS_TAB]
    public let walletTitle = "Administrá tus medios de pago 💳"
    
    func getUserCards() -> [Card]{
        return User.getUserFromKeychain()?.cards ?? []
    }
    
    func getUserAccounts() -> [Account]{
        return User.getUserFromKeychain()?.accounts ?? []
    }

}

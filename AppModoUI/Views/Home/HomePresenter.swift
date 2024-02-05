//
//  HomePresenter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

protocol HomePresenterProtocol {
    func createAccountsCarrousel(observerName: String, accountsInformation: [AccountInformation])
    func createPromosCarrousel(observerName: String, promotions: Promotion)
}

class HomePresenter {
    
    private let user = User.getUserFromKeychain()!
    
    //Use Case
    let accountUseCase = AccountUseCase()
    
    //View
    var view: HomePresenterProtocol
    
    init(view: HomePresenterProtocol){
        self.view = view
    }
    
    func getUser() -> User? {
        return user
    }
    
    @MainActor
    func configureAccountsCarrousel() {
        let observerName = ObserversNames.ACCOUNT_CARROUSEL
       
        var accountsInformation: [AccountInformation] = []
      
        for account in user.accounts {
            accountsInformation.append(AccountInformation.createAccountInformation(account: account, balance: nil))
        }
       
        view.createAccountsCarrousel(observerName: observerName, accountsInformation: accountsInformation)
        
        accountUseCase.getAccountBalances(accounts: user.accounts) { accountsInformation in
            Keychain.saveToKeychain(key: KeychainKeys.ACCOUNTS_INFORMATION, save: encodeClass(clase: accountsInformation)!)
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name(observerName), object: accountsInformation)
            }
        }
    }
    
    @MainActor
    func configurePromotionsCarrousel() {
        let observerName = ObserversNames.PROMOTIONS_HUB
        view.createPromosCarrousel(observerName: observerName, promotions: Promotion(cards: []))
        
        getPromotions() { promotion in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name(observerName), object: promotion)
            }
        }
    }
    
    func getPromotions(onCompletion: @escaping (_ promotion: Promotion) -> Void){
        Task.detached {
            do{
                try await PromosAPI.shared.getPrimaryHub()
                
                onCompletion(Promotion.getPromotionsHub())
            } catch let error {
                print(error)
            }
        }
    }
}

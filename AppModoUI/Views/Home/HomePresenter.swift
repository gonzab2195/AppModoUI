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
    
    let user = User.getUserFromKeychain()!
    
    //View
    var view: HomePresenterProtocol
    
    init(view: HomePresenterProtocol){
        self.view = view
    }
    
    @MainActor
    func configureAccountsCarrousel() {
        let observerName = ObserversNames.ACCOUNT_CARROUSEL
       
        var accountsInformation: [AccountInformation] = []
      
        for account in user.accounts {
            accountsInformation.append(AccountInformation.createAccountInformation(account: account, balance: nil))
        }
       
        view.createAccountsCarrousel(observerName: observerName, accountsInformation: accountsInformation)
        
        getAccountBalances(accounts: user.accounts) { accountsInformation in
            Keychain.saveToKeychain(key: KeychainKeys.ACCOUNTS_INFORMATION, save: encodeClass(clase: accountsInformation)!)
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name(observerName), object: accountsInformation)
            }
        }
    }
    
    func getAccountBalances(accounts: [Account], onCompletion: @escaping (_ accountsInformation: [AccountInformation]) -> Void) {
        
        Task.detached {
            var accountsInformation: [AccountInformation] = []
            
            var banksResponses = [String: [BankAccount]]()
            
            for account in accounts {
                
                var bankAccount: [BankAccount]?
                
                do{
                    
                    if banksResponses[account.bank.id] == nil {
                        
                        bankAccount = try await BankAPI.shared.getAccountsInformation(bankId: account.bank.id)
                        banksResponses[account.bank.id] = bankAccount
                    }
                    
                } catch let error {
                    
                    let errorDecoded = error as NSError
                    if(errorDecoded.code == ErrorCodes.UNAUTHORIZED.rawValue){
                        return
                    }
                    
                }
                    
                var balance: Float?  = nil
                
                if let bankAccounts = banksResponses[account.bank.id] {
                    
                    balance = bankAccounts.first(where: { $0.id == account.id})?.balance
                    
                }
                
                accountsInformation.append(
                    AccountInformation.createAccountInformation(account: account,
                                                                balance: balance))
               
            }
            
            onCompletion(accountsInformation)
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

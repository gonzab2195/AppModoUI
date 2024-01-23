//
//  HomePresenter.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import Foundation

protocol HomePresenterProtocol {
    func createAccountsCarrousel(accountsInformation: [AccountInformation])
    func createPromosCarrousel(promotions: Promotion)
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
        
        var accountsInformation: [AccountInformation] = []
        
        var banksCalled = Set<String>()
        
        Task {
            for account in user.accounts {
                
                do{
                    
                    if !banksCalled.contains(account.bank.id) {
                        try await BankAPI.shared.getAccountsInformation(bankId: account.bank.id)
                        banksCalled.insert( account.bank.id)
                    }
                    
                    if let bankAccount = BankAccount.getAccountsFromBank(bankId: account.bank.id)?.first(where: { $0.id == account.id}) {
                        
                        accountsInformation.append(AccountInformation(bankId: account.bank.id,
                                                                      bankName: account.bank.name,
                                                                      bankLogo: account.bank.imageUrl,
                                                                      accountId: account.id,
                                                                      accountType: account.type,
                                                                      accountLastDigits: account.lastDigits,
                                                                      accountBalance: bankAccount.balance,
                                                                      favorite: account.favourite))
                        
                    }
                } catch let error {
                    print(error)
                }
            }
                    
            view.createAccountsCarrousel(accountsInformation: accountsInformation)
        }
    }
    
    @MainActor
    func configurePromotionsCarrousel() {
                        
        Task {
            do{
                try await PromosAPI.shared.getPrimaryHub()
            } catch let error {
                print(error)
            }

            view.createPromosCarrousel(promotions: Promotion.getPromotionsHub())

        }
    }
}

//
//  AccountCarrouselUseCase.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 02/02/2024.
//

import Foundation

protocol AccountUseCaseProtocol {
    func getAccountBalances(accounts: [Account], onCompletion: @escaping (_ accountsInformation: [AccountInformation]) -> Void)
}

class AccountUseCase: AccountUseCaseProtocol {
    
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
}

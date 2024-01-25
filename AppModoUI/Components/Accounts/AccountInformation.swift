//
//  AccountInformation.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import Foundation

struct AccountInformation: Decodable {
    
    let bankId: String
    let bankName: String
    let bankLogo: String
    let accountId: String
    let accountType: String
    let accountLastDigits: String
    let accountBalance: Float?
    let favorite: Bool
    
    static func createAccountInformation(account: Account, balance: Float?) -> AccountInformation{
        
        
        let decoder = NetworkManager.createDecoder()
        var accountsInformation: [AccountInformation] = []
        
        do{
            
            let keychainData = Keychain.retrieveKeyFromKeychain(key: KeychainKeys.ACCOUNTS_INFORMATION)!.data(using: .utf8)
            if let data = keychainData {
                accountsInformation = try decoder.decode([AccountInformation].self, from: data)
            }
        } catch let error {
            print(error)
            accountsInformation = []
        }
        
        return AccountInformation(bankId: account.bank.id,
                                  bankName: account.bank.name,
                                  bankLogo: account.bank.imageUrl,
                                  accountId: account.id,
                                  accountType: account.type,
                                  accountLastDigits: account.lastDigits,
                                  accountBalance: balance != nil ? balance : accountsInformation.first(where: { $0.accountId == account.id})?.accountBalance ?? nil,
                                  favorite: account.favourite)
        
    }
}

extension AccountInformation: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bankId, forKey: .bankId)
        try container.encode(bankName, forKey: .bankName)
        try container.encode(bankLogo, forKey: .bankLogo)
        try container.encode(accountId, forKey: .accountId)
        try container.encode(accountType, forKey: .accountType)
        try container.encode(accountLastDigits, forKey: .accountLastDigits)
        try container.encode(accountLastDigits, forKey: .accountLastDigits)
        try container.encode(accountBalance, forKey: .accountBalance)
        try container.encode(favorite, forKey: .favorite)
    }
}

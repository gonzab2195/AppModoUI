//
//  BankAccount.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import Foundation

struct BankAccount: Decodable {
    
    let id: String
    let balance: Float
    let balanceUpdatedAt: String
    let lastDigits: String
    let currencyCode: String
    //let features: AnyObject?
    let type: String
    let featureFlags: FeatureFlags
}

extension BankAccount: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(balance, forKey: .balance)
        try container.encode(balanceUpdatedAt, forKey: .balanceUpdatedAt)
        try container.encode(currencyCode, forKey: .currencyCode)
        try container.encode(lastDigits, forKey: .lastDigits)
        //try container.encode(features, forKey: .features)
        try container.encode(featureFlags, forKey: .featureFlags)
        try container.encode(type, forKey: .type)
    }
}

extension BankAccount {
    
    static func getAccountsFromBank(bankId: String) -> [BankAccount]?{
        do{
            let decoder = NetworkManager.createDecoder()
            let userAsString = Keychain.retrieveKeyFromKeychain(key: "bank_\(bankId)")
            
            guard let userAsData = userAsString!.data(using: .utf8) else {
                return []
            }
            
            let userDecoded = try decoder.decode([BankAccount].self, from: userAsData)
            
            return userDecoded
        } catch {
            return []
        }
    }
}


struct FeatureFlags: Decodable {
    let makeTransfer: Bool
    let destinationAccountType: Virtual
}

extension FeatureFlags: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(makeTransfer, forKey: .makeTransfer)
        try container.encode(destinationAccountType, forKey: .destinationAccountType)
    }
}

struct Virtual : Decodable {
    let virtual: Bool
}

extension Virtual: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(virtual, forKey: .virtual)
    }
}

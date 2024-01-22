//
//  User.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

struct User: Decodable {
    
   let id: String
   let name: String
   let firstName: String
   let lastName: String
   let createdAt: String
   let phoneNumber: String
   let dni: String
   let accounts: [Account]
   let cards: [Card]
   let emailValidated: Bool
   let email: String
   let gender: String
   let identityValidation: Bool
   let receiveBenefits: Bool
   let memberGetMembersAmount: String
   let memberGetMembersMaxAmount: String
   let memberGetMembersUrl: String
   let suggestedBanks: [String]? // TIPAR
   let suggestedBanksByCards: [SuggestedBanksByCards]?
   let licensePlates: [String]? // TIPAR
   let image: String?

   static func emptyUser() -> User{
        return User(id: "", name: "", firstName: "", lastName: "", createdAt: "", phoneNumber: "", dni: "", accounts: [], cards: [], emailValidated: false, email: "", gender: "", identityValidation: false, receiveBenefits: false, memberGetMembersAmount: "", memberGetMembersMaxAmount: "", memberGetMembersUrl: "", suggestedBanks: [], suggestedBanksByCards: [], licensePlates: [], image: "")
    }
}

extension User: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(dni, forKey: .dni)
        try container.encode(accounts, forKey: .accounts)
        try container.encode(cards, forKey: .cards)
        try container.encode(emailValidated, forKey: .emailValidated)
        try container.encode(email, forKey: .email)
        try container.encode(gender, forKey: .gender)
        try container.encode(identityValidation, forKey: .identityValidation)
        try container.encode(receiveBenefits, forKey: .receiveBenefits)
        try container.encode(memberGetMembersAmount, forKey: .memberGetMembersAmount)
        try container.encode(memberGetMembersMaxAmount, forKey: .memberGetMembersMaxAmount)
        try container.encode(memberGetMembersUrl, forKey: .memberGetMembersUrl)
        try container.encode(suggestedBanks, forKey: .suggestedBanks)
        try container.encode(suggestedBanksByCards, forKey: .suggestedBanksByCards)
        try container.encode(licensePlates, forKey: .licensePlates)
        try container.encode(image, forKey: .image)
    }
}

extension User {
    
    func userInitials() -> String {
        let words = name.components(separatedBy: " ")
        let firstLetters = words.map { $0.prefix(1) }
        return firstLetters.joined()
    }
    
    static func getUserFromKeychain() -> User?{
        do{
            let decoder = NetworkManager.createDecoder()
            let userAsString = Keychain.retrieveKeyFromKeychain(key: KeychainKeys.ME)
            
            guard let userAsData = userAsString!.data(using: .utf8) else {
                return self.emptyUser()
            }
            let userDecoded = try decoder.decode(User.self, from: userAsData)
            
            return userDecoded
        } catch {
            return self.emptyUser()
        }
    }
}

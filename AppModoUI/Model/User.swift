//
//  User.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

struct User: Decodable {
    
   let id: String?
   let name: String?
   let firstName: String?
   let lastName: String?
   let createdAt: String?
   let phoneNumber: String?
   let dni: String?
   let accounts: [String]? // TIPAR
   let cards: [Card]?
   let emailValidated: Bool?
   let email: String?
   let gender: String?
   let identityValidation: Bool?
   let recieveBenefits: Bool?
   let memberGetMembersAmount: String?
   let memberGetMembersMaxAmount: String?
   let memberGetMembersUrl: String?
   let suggestedBanks: [String]? // TIPAR
   let suggestedBanksByCards: [SuggestedBanksByCards]?
   let licensePlates: [String]? // TIPAR
   let image: String?
    
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
        try container.encode(recieveBenefits, forKey: .recieveBenefits)
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
        
        guard let name = self.name else {
            print("erroror")
            return ""
        }
        
        let words = name.components(separatedBy: " ")
        let firstLetters = words.map { $0.prefix(1) }
        return firstLetters.joined()
    }
    
    static func getUserFromKeychain() -> User?{
        do{
            let decoder = NetworkManager.createDecoder()
            let userAsString = retrieveTokenFromKeychain(key: KeychainKeys.ME)
            let userAsData = userAsString!.data(using: .utf8)
            
            return try decoder.decode(User.self, from: userAsData! )
        } catch {
            return nil
        }
    }
}

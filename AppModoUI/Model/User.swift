//
//  User.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class User: Decodable {
    
    var id: String?
    var name: String?
    var firstName: String?
    var lastName: String?
    var createdAt: String?
    var phoneNumber: String?
    var dni: String?
    var accounts: [String]? // TIPAR
    var cards: [Card]?
    var emailValidated: Bool?
    var email: String?
    var gender: String?
    var identityValidation: Bool?
    var recieveBenefits: Bool?
    var memberGetMembersAmount: String?
    var memberGetMembersMaxAmount: String?
    var memberGetMembersUrl: String?
    var suggestedBanks: [String]? // TIPAR
    var suggestedBanksByCards: [SuggestedBanksByCards]?
    var licensePlates: [String]? // TIPAR
    var image: String?
    
    init(){}
    
    init(id: String?, name: String?, firstName: String?, lastName: String?, createdAt: String?, phoneNumber: String?, dni: String?, accounts: [String]?, cards: [Card]?, emailValidated: Bool?, email: String?, gender: String?, identityValidation: Bool?, recieveBenefits: Bool?, memberGetMembersAmount: String?, memberGetMembersMaxAmount: String?, memberGetMembersUrl: String?, suggestedBanks: [String], suggestedBanksByCards: [SuggestedBanksByCards]?, licensePlates: [String], image: String?) {
        self.id = id
        self.name = name
        self.firstName = firstName
        self.lastName = lastName
        self.createdAt = createdAt
        self.phoneNumber = phoneNumber
        self.dni = dni
        self.accounts = accounts
        self.cards = cards
        self.emailValidated = emailValidated
        self.email = email
        self.gender = gender
        self.identityValidation = identityValidation
        self.recieveBenefits = recieveBenefits
        self.memberGetMembersAmount = memberGetMembersAmount
        self.memberGetMembersMaxAmount = memberGetMembersMaxAmount
        self.memberGetMembersUrl = memberGetMembersUrl
        self.suggestedBanks = suggestedBanks
        self.suggestedBanksByCards = suggestedBanksByCards
        self.licensePlates = licensePlates
        self.image = image
    }
}



//
//  Card.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class Card: Decodable {
    
    let id: String?
    let issuerName: String?
    let favourite: Bool?
    let expiry: String?
    let type: String?
    let bin: String?
    let lastDigits: String?
    let expired: Bool?
    let bank: Bank?
    let color: String?
    let cardColor: String?
    let bankLogo: String?
    let issuerLogo: String?
    let issuerBackgroundLogo: String?
    let recentlyPushed: Bool?
    let enrollmentType: String?
    let details_available: Bool?
    let cvvType: String?
    let prepaid: Bool?
    let cardArt: CardArt?
    
    init(id: String?, issuerName: String?, favourite: Bool?, expiry: String?, type: String?, bin: String?, lastDigits: String?, expired: Bool?, bank: Bank?, color: String?, cardColor: String?, bankLogo: String?, issuerLogo: String?, issuerBackgroundLogo: String?, recentlyPushed: Bool?, enrollmentType: String?, details_available: Bool?, cvvType: String?, prepaid: Bool?, cardArt: CardArt?) {
        self.id = id
        self.issuerName = issuerName
        self.favourite = favourite
        self.expiry = expiry
        self.type = type
        self.bin = bin
        self.lastDigits = lastDigits
        self.expired = expired
        self.bank = bank
        self.color = color
        self.cardColor = cardColor
        self.bankLogo = bankLogo
        self.issuerLogo = issuerLogo
        self.issuerBackgroundLogo = issuerBackgroundLogo
        self.recentlyPushed = recentlyPushed
        self.enrollmentType = enrollmentType
        self.details_available = details_available
        self.cvvType = cvvType
        self.prepaid = prepaid
        self.cardArt = cardArt
    }
    
}

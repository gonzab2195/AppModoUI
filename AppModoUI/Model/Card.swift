//
//  Card.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

struct Card: Decodable {
    
    let id: String
    let issuerName: String
    let favourite: Bool
    let expiry: String
    let type: String
    let bin: String
    let lastDigits: String
    let expired: Bool?
    let bank: Bank
    let color: String?
    let cardColor: String
    let bankLogo: String
    let issuerLogo: String
    let issuerBackgroundLogo: String
    let recentlyPushed: Bool
    let enrollmentType: String
    let detailsAvailable: Bool
    let cvvType: String
    let prepaid: Bool
    let cardArt: CardArt
    
}

extension Card: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(issuerName, forKey: .issuerName)
        try container.encode(favourite, forKey: .favourite)
        try container.encode(expiry, forKey: .expiry)
        try container.encode(type, forKey: .type)
        try container.encode(bin, forKey: .bin)
        try container.encode(lastDigits, forKey: .lastDigits)
        try container.encode(bank, forKey: .bank)
        try container.encode(color, forKey: .color)
        try container.encode(cardColor, forKey: .cardColor)
        try container.encode(bankLogo, forKey: .bankLogo)
        try container.encode(issuerLogo, forKey: .issuerLogo)
        try container.encode(issuerBackgroundLogo, forKey: .issuerBackgroundLogo)
        try container.encode(recentlyPushed, forKey: .recentlyPushed)
        try container.encode(enrollmentType, forKey: .enrollmentType)
        try container.encode(detailsAvailable, forKey: .detailsAvailable)
        try container.encode(cvvType, forKey: .cvvType)
        try container.encode(prepaid, forKey: .prepaid)
        try container.encode(cardArt, forKey: .cardArt)
    }
}

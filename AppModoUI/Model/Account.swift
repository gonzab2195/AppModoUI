//
//  Account.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 22/01/2024.
//

import Foundation

struct Account: Decodable {
    
    let id: String
    let lastDigits: String
    let type: String
    let currencyCode: String
    let favourite: Bool
    let bank: Bank
    let schema: String
    let createdAt: String
    
}

extension Account: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(lastDigits, forKey: .lastDigits)
        try container.encode(type, forKey: .type)
        try container.encode(currencyCode, forKey: .currencyCode)
        try container.encode(favourite, forKey: .favourite)
        try container.encode(bank, forKey: .bank)
        try container.encode(schema, forKey: .schema)
        try container.encode(createdAt, forKey: .createdAt)
    }
}

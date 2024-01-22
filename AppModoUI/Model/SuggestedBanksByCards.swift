//
//  SuggestedBanksByCards.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

struct SuggestedBanksByCards: Decodable {
    
    let id: String
    let name: String
    let imageUrl: String
    let canLink: Bool
    let automaticCardLinking: Bool
    let favourite: Bool
    
}

extension SuggestedBanksByCards: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(imageUrl, forKey: .imageUrl)
        try container.encode(canLink, forKey: .canLink)
        try container.encode(automaticCardLinking, forKey: .automaticCardLinking)
        try container.encode(favourite, forKey: .favourite)

    }
}

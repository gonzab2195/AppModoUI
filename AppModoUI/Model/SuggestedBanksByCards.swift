//
//  SuggestedBanksByCards.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class SuggestedBanksByCards: Decodable {
    
    let id: String?
    let name: String?
    let imageUrl: String?
    let canLink: Bool?
    let automaticCardLinking: Bool?
    let favourite: Bool?
    
    init(id: String?, name: String?, imageUrl: String?, canLink: Bool?, automaticCardLinking: Bool?, favourite: Bool?) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.canLink = canLink
        self.automaticCardLinking = automaticCardLinking
        self.favourite = favourite
    }
    
}

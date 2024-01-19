//
//  CardArt.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class CardArt: Decodable {
    let active: Bool?
    
    init(active: Bool?) {
        self.active = active
    }
}

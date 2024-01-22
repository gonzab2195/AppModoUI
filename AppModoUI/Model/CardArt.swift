//
//  CardArt.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

struct CardArt: Decodable {
    let active: Bool
    
    init(active: Bool) {
        self.active = active
    }
}

extension CardArt: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(active, forKey: .active)
    }
}

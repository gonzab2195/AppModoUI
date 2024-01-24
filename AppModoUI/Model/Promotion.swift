//
//  Promotion.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import Foundation

struct Promotion: Decodable {
    
    let cards: [PromosCard]
    
}

extension Promotion {
    
    static func getPromotionsHub() -> Promotion{
        do{
            let decoder = NetworkManager.createDecoder()
            let userAsString = Keychain.retrieveKeyFromKeychain(key: KeychainKeys.PROMOS_HUB)
            
            guard let userAsData = userAsString!.data(using: .utf8) else {
                return Promotion(cards: [])
            }
            
            let promosDecoded = try decoder.decode(Promotion.self, from: userAsData)
            
            return promosDecoded
        } catch {
            return Promotion(cards: [])
        }
    }
}

struct PromosCard: Decodable {
    let landscapeApp: String
}

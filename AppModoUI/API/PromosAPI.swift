//
//  PromosAPI.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import Foundation

final class PromosAPI: NetworkManagerProtocol {
    
    static let baseURL = "https://rewards-handler.playdigital.com.ar/slots/"
    
    private let promosHub = baseURL + "web-modo-hub-carrousel_principal"
    static var shared = PromosAPI()
    
    func getPrimaryHub() async throws  {
        let endpointURL = URL(string: promosHub)!
        
        let request = URLRequest(url: endpointURL)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        try NetworkManager.responseHasError(response: response, data: data)
        
        Keychain.saveToKeychain(key: KeychainKeys.PROMOS_HUB, save: String(data: data, encoding: .utf8)!)
    }
    
}


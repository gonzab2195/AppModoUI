//
//  UserAPI.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

final class UserAPI: NetworkManagerProtocol {
    
    static let baseURL = "https://api.preprod.playdigital.com.ar/users/"
    
    private let meUrl = baseURL + "me"
    
    static let shared = UserAPI()
    
    private init(){}
    
    func getUserInfo() async throws {
        
        do {
            let url = try NetworkManager.createURL(urlString: meUrl)
             
            var request = URLRequest(url: url)
            request.httpMethod = NetworkManager.GET
            request.addValue(MockData.FINGERPRINT, forHTTPHeaderField: NetworkManager.FINGERPRINT_HEADER)
            request.addValue(Keychain.retrieveKeyFromKeychain(key: KeychainKeys.ACCESS_TOKEN) ?? "", forHTTPHeaderField: NetworkManager.AUTHORIZATION_HEADER)
          
            let (data, response) = try await URLSession.shared.data(for: request)
            
            try NetworkManager.responseHasError(response: response, data: data)
                                  
            Keychain.saveToKeychain(key: KeychainKeys.ME,
                                save: String(data: data, encoding: .utf8)!)

            
        } catch let error {
            NetworkManager.isDecodingError(error: error)
            throw error
        }
        
    }
}

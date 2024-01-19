//
//  UserAPI.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

final class UserAPI: NetworkManagerProtocol {
    
    
    static let baseURL = "https://api.qa.playdigital.com.ar/users/"
    private let meUrl = baseURL + "me"
    
    static let shared = UserAPI()
    
    private init(){}
    
    func getUserInfo() async throws -> User {
        
        do {
            
            let url = try NetworkManager.createURL(urlString: meUrl)
             
            var request = URLRequest(url: url)
            request.httpMethod = NetworkManager.GET
            request.addValue(MockData.FINGERPRINT, forHTTPHeaderField: NetworkManager.FINGERPRINT_HEADER)
            request.addValue(retrieveTokenFromKeychain(key: KeychainKeys.ACCESS_TOKEN) ?? "", forHTTPHeaderField: NetworkManager.AUTHORIZATION_HEADER)
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Respuesta incorrecta"])
            }
            
            try NetworkManager.responseHasError(httpStatus: httpResponse.statusCode, data: data)
                      
            let decoder = NetworkManager.createDecoder()
            let decodedResponse = try decoder.decode(User.self, from: data)
            
            return decodedResponse
            
        } catch let error {
            NetworkManager.isDecodingError(error: error)
            print(error)
            return User()
        }
        
    }
}

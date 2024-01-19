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
        
        guard let url = URL(string:meUrl) else{
            throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "URL Incorrecta"])
        }
        
        do {            
            var request = URLRequest(url: url)
            request.httpMethod = NetworkManager.GET
            request.addValue(MockData.FINGERPRINT, forHTTPHeaderField: NetworkManager.FINGERPRINT_HEADER)
            request.addValue(retrieveTokenFromKeychain(key: KeychainKeys.ACCESS_TOKEN) ?? "", forHTTPHeaderField: NetworkManager.AUTHORIZATION_HEADER)
            let (data, response) = try await URLSession.shared.data(for: request)
           
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
             
                let decodedError: ErrorResponse = try decoder.decode(ErrorResponse.self, from: data)
                                
                throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: decodedError.errors?.first?.message ?? ""])
            }
            
            print(httpResponse.statusCode)
          
            let decodedResponse = try decoder.decode(User.self, from: data)
            
            return decodedResponse
            
        } catch let error {
            if let decodingError = error as? DecodingError {
                   switch decodingError {
                   case .dataCorrupted(let context):
                       print("Data Corrupted: \(context)")
                   case .keyNotFound(let key, let context):
                       print("Key Not Found - Key: \(key), Context: \(context)")
                   case .typeMismatch(let type, let context):
                       print("Type Mismatch - Type: \(type), Context: \(context)")
                   case .valueNotFound(let type, let context):
                       print("Value Not Found - Type: \(type), Context: \(context)")
                   @unknown default:
                       print("Error desconocido durante la decodificación")
                   }
               }
            return User()
        }
        
    }
}

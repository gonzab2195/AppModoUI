//
//  LoginAPI.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 17/01/2024.
//

import UIKit

final class LoginAPI: NetworkManagerProtocol {
    
    static let baseURL = "https://api.qa.playdigital.com.ar/v2/auth/"
    private let loginURL = baseURL + "login"
    
    static let shared = LoginAPI()

    private init(){}
    
    func doLogin(password: String) async throws -> Login {
        
        guard let url = URL(string:loginURL) else{
            throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "URL Incorrecta"])
        }
        
        let datosParaEnviar: [String: Any] = [
            "dni": MockData.DNI,
            "phone_number": MockData.PHONE,
            "password": password
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: datosParaEnviar)
            
            var request = URLRequest(url: url)
            request.httpMethod = NetworkManager.POST
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: NetworkManager.CONTENT_TYPE_HEADER)
            request.addValue(MockData.FINGERPRINT, forHTTPHeaderField: NetworkManager.FINGERPRINT_HEADER)
            
            let (data, response) = try await URLSession.shared.data(for: request)
           
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Respuesta incorrecta"])
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedResponse = try decoder.decode(Login.self, from: data)
            
            return decodedResponse
            
        } catch {
           return Login()
        }
    }
}

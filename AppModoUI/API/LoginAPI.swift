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
        
        do {
            
            let url = try NetworkManager.createURL(urlString: loginURL)
           
            let dataToSend: [String: Any] = [
                "dni": MockData.DNI,
                "phone_number": MockData.PHONE,
                "password": password
            ]
        
       
            let jsonData = try JSONSerialization.data(withJSONObject: dataToSend)
            
            var request = URLRequest(url: url)
            request.httpMethod = NetworkManager.POST
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: NetworkManager.CONTENT_TYPE_HEADER)
            request.addValue(MockData.FINGERPRINT, forHTTPHeaderField: NetworkManager.FINGERPRINT_HEADER)
            request.timeoutInterval = 10
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Respuesta incorrecta"])
            }
           
            try NetworkManager.responseHasError(httpStatus: httpResponse.statusCode, data: data)
            
            let decoder = NetworkManager.createDecoder()
            let decodedResponse = try decoder.decode(Login.self, from: data)
            
            return decodedResponse
         
        } catch let error {
           NetworkManager.isDecodingError(error: error)
           print(error)
           return Login()
        }
    }
}

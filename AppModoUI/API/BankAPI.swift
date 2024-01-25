//
//  BanksAPI.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import Foundation

final class BankAPI: NetworkManagerProtocol {
    
    static let baseURL = "https://api.preprod.playdigital.com.ar/banks/"
    
    private let bankAccounts = baseURL + "#bankaccount#/accounts"
    static var shared = BankAPI()
    
    func getAccountsInformation(bankId: String) async throws -> [BankAccount] {
        let endpointURL = URL(string: bankAccounts.replacingOccurrences(of: "#bankaccount#", with: bankId))!
        
        var request = URLRequest(url: endpointURL)
        
        request.addValue(MockData.FINGERPRINT, forHTTPHeaderField: NetworkManager.FINGERPRINT_HEADER)
        request.addValue(Keychain.retrieveKeyFromKeychain(key: KeychainKeys.ACCESS_TOKEN) ?? "", forHTTPHeaderField: NetworkManager.AUTHORIZATION_HEADER)
        request.addValue("9", forHTTPHeaderField: "x-api-version")
        request.addValue("1.78.0", forHTTPHeaderField: "x-app-version")
        request.addValue("1078000", forHTTPHeaderField: "x-app-build-number")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        try NetworkManager.responseHasError(response: response, data: data)
        
        let decoder = NetworkManager.createDecoder()
        let bankAccount = try decoder.decode([BankAccount].self, from: data)
        
        return bankAccount
        
    }
    
}


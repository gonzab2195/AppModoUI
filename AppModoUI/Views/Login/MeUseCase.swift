//
//  MeUseCase.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 02/02/2024.
//

import Foundation

protocol MeUseCaseProtocol {
    func getMe() async throws
}

class MeUseCase {
    
    func getMe() async throws{
        let user = try await UserAPI.shared.getUserInfo()
        
        let encoder = JSONEncoder()

        if let jsonData = try? encoder.encode(user),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            
            Keychain.saveToKeychain(key: KeychainKeys.ME,
                                save: jsonString)
        }
        
        
    }
    
}

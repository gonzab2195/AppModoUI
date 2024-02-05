//
//  LoginUseCase.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 02/02/2024.
//

import Foundation

protocol DoLoginProtocol {
    func doLogin(password: String) async throws
}

class LoginUseCase: DoLoginProtocol {
   
    func doLogin(password: String) async throws {
        let login = try await AuthAPI.shared.doLogin(password: password)
        
        Keychain.saveToKeychain(key: "userPassword", save: password)
        
        Keychain.saveToKeychain(key: KeychainKeys.ACCESS_TOKEN,
                            save: login.accessToken)
        Keychain.saveToKeychain(key: KeychainKeys.REFRESH_TOKEN,
                            save: login.refreshToken)
    }
    
}

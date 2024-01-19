//
//  Login.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 17/01/2024.
//

import Foundation

class Login : Decodable {
    
    var accessToken: String?
    var idToken: String?
    var refreshToken: String?
    var expiresIn: Int?
    var tokenType: String?
    var identityValidation: Bool?
    var softtokenInvalid: Bool?
    var onboardingVersion: String?
    var additionalData: Bool?
    var identityDocumentInfo: Bool?
    var lastLogin: String?
    
    init(){}
    
    init(accessToken: String, idToken: String, refreshToken: String, expiresIn: Int, tokenType: String, identityValidation: Bool, softtokenInvalid: Bool, onboardingVersion: String, additionalData: Bool, identityDocumentInfo: Bool, lastLogin: String) {
        self.accessToken = accessToken
        self.idToken = idToken
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
        self.tokenType = tokenType
        self.identityValidation = identityValidation
        self.softtokenInvalid = softtokenInvalid
        self.onboardingVersion = onboardingVersion
        self.additionalData = additionalData
        self.identityDocumentInfo = identityDocumentInfo
        self.lastLogin = lastLogin
    }
    
}



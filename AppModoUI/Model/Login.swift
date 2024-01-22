//
//  Login.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 17/01/2024.
//

import Foundation

struct Login : Decodable {
   let accessToken: String
   let idToken: String
   let refreshToken: String
   let expiresIn: Int
   let tokenType: String
   let identityValidation: Bool
   let softtokenInvalid: Bool
   let onboardingVersion: String
   let additionalData: Bool
   let identityDocumentInfo: Bool
   let lastLogin: String
}



//
//  InternalCodes.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 01/02/2024.
//

import Foundation


struct InternalCodes {
    
    public static let AUTHENTICATION_FAILED = "authentication_fail"
    public static let USER_BLOCKED = "user_blocked"
    
    private static let INTERNAL_CODES: [String: String] = [
        AUTHENTICATION_FAILED: "Clave incorrecta. Te quedan ## intentos",
        USER_BLOCKED: "Bloqueamos tu clave por seguridad"
    ]
    
    public static func getInternalMessage(internalMessage: String, toReplace text: String? = nil) -> String?{
        
        if let message = INTERNAL_CODES[internalMessage] {
            
            if(text != nil){
                return message.replacingOccurrences(of: "##", with: text!)
            }
        }
        
        return nil
        
    }
    
}



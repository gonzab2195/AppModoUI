//
//  UsersDefault.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 29/01/2024.
//

import Foundation

protocol UsersDefaultProtocol {
    
    static func saveToUserDefault(key: String, save: String)
    static func getFromUserDefault(key: String) -> String?
}

class UsersDefault: UsersDefaultProtocol {
    
    private static let defaults = UserDefaults.standard
    
    static func saveToUserDefault(key: String, save: String) {
        
        defaults.set(save, forKey: key)
        defaults.synchronize()
        
    }
    
    static func getFromUserDefault(key: String) -> String? {
        
        return defaults.string(forKey: key)
        
    }

    
    
    
}

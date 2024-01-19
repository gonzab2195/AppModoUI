//
//  NetworkManager.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 17/01/2024.
//

import Foundation

protocol NetworkManagerProtocol {
    
    static var baseURL: String { get }
}

class NetworkManager {
    
    public static let GET = "GET"
    public static let POST = "POST"
    public static let AUTHORIZATION_HEADER = "Authorization"
    public static let FINGERPRINT_HEADER = "x-fingerprint"
    public static let CONTENT_TYPE_HEADER = "Content-Type"
}

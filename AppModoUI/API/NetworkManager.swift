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
    
    static let GET = "GET"
    static let POST = "POST"
    static let AUTHORIZATION_HEADER = "Authorization"
    static let FINGERPRINT_HEADER = "x-fingerprint"
    static let CONTENT_TYPE_HEADER = "Content-Type"
    
    static func createDecoder() -> JSONDecoder{
        
        let decoder = JSONDecoder();
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
        
    }
    
    static func createURL(urlString: String) throws -> URL {
        
        guard let url = URL(string: urlString) else{
            throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "URL Incorrecta"])
        }
        
        return url
    }
    
    static func responseHasError(response: URLResponse, data: Data) throws{
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Respuesta incorrecta"])
        }
        
        let httpStatus = httpResponse.statusCode
        
        let decoder = createDecoder()
        
        if httpStatus == ErrorCodes.UNAUTHORIZED.rawValue {
            let observerName = Notification.Name(ObserversNames.LOG_OUT)
            NotificationCenter.default.post(name: observerName, object: nil)
        }
        
        if httpStatus != ErrorCodes.OK.rawValue {
            let decodedError: ErrorResponse = try decoder.decode(ErrorResponse.self, from: data)
            throw NSError(domain: decodedError.internalCode, code: httpStatus, userInfo: [NSLocalizedDescriptionKey: decodedError.errors.first?.message ?? "No Message"])
        }
        
    }
    
    static func isDecodingError(error: Error){
        
        if let decodingError = error as? DecodingError {
           switch decodingError {
               case .dataCorrupted(let context):
                   print("Data Corrupted: \(context)")
               case .keyNotFound(let key, let context):
                   print("Key Not Found - Key: \(key), Context: \(context)")
               case .typeMismatch(let type, let context):
                   print("Type Mismatch - Type: \(type), Context: \(context)")
               case .valueNotFound(let type, let context):
                   print("Value Not Found - Type: \(type), Context: \(context)")
               @unknown default:
                   print("Error desconocido durante la decodificación")
            }
        }
        
    }
    
}

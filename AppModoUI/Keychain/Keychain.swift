import Security
import Foundation

protocol KeychainProtocol {
    static func saveToKeychain(key: String, save: String) -> Void
    static func retrieveKeyFromKeychain(key: String) -> String?
    static func deleteKeyFromKeychain(keyToDelete: String) -> Void
}

class Keychain : KeychainProtocol {
    
    static func saveToKeychain(key: String, save: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let newData: [String: Any] = [
            kSecValueData as String: save.data(using: .utf8)!
        ]
        
        var status = SecItemCopyMatching(query as CFDictionary, nil)
        
        switch status {
            case errSecSuccess:
                status = SecItemUpdate(query as CFDictionary, newData as CFDictionary)
                
            case errSecItemNotFound:
                var newItemQuery = query
                newItemQuery[kSecValueData as String] = save.data(using: .utf8)!
                
                status = SecItemAdd(newItemQuery as CFDictionary, nil)
                
            default:
                print("Error inesperado al acceder al Keychain: \(status)")
        }
    }
    
    static func retrieveKeyFromKeychain(key: String) -> String? {
        let keychainQuery: [String: Any] = [
                   kSecClass as String: kSecClassGenericPassword,
                   kSecAttrAccount as String: key,
                   kSecReturnData as String: kCFBooleanTrue!,
                   kSecMatchLimit as String: kSecMatchLimitOne
               ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess {
            if let data = dataTypeRef as? Data, let token = String(data: data, encoding: .utf8) {
                return token
            }
        }
        
        return nil
    }
    
    static func deleteKeyFromKeychain(keyToDelete: String) {
        let keychainQuery = [
                kSecClass as String: kSecClassGenericPassword as String,
                kSecAttrAccount as String: keyToDelete] as [String : Any]
        
        var result: AnyObject?
        let keyExistsStatus = SecItemCopyMatching(keychainQuery as CFDictionary, &result)

        if keyExistsStatus == errSecSuccess {
            SecItemDelete(keychainQuery as CFDictionary)
        } else {
            print("No existe la key a eliminar \(keyToDelete)")
        }
    }
}

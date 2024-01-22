import Security
import Foundation

class Keychain {
    
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
            // El ítem ya existe, por lo que actualizamos el valor
            status = SecItemUpdate(query as CFDictionary, newData as CFDictionary)
            if status != errSecSuccess {
                print("Error al actualizar el valor en el Keychain: \(status)")
            } else {
                print("Valor actualizado correctamente en el Keychain: \(key)")
            }
            
        case errSecItemNotFound:
            // El ítem no existe, así que lo creamos
            var newItemQuery = query
            newItemQuery[kSecValueData as String] = save.data(using: .utf8)!
            
            status = SecItemAdd(newItemQuery as CFDictionary, nil)
            if status != errSecSuccess {
                print("Error al guardar el valor en el Keychain: \(status)")
            } else {
                print("Valor guardado correctamente en el Keychain: \(key)")
            }
            
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
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "yourServiceName",
            kSecAttrAccount as String: keyToDelete
        ]
        
        // Delete the property associated with the key
        let status = SecItemDelete(query as CFDictionary)
        
        // Check the status to ensure the deletion was successful
        if status == errSecSuccess {
            print("Property deleted successfully.")
        } else {
            print("Error deleting property: \(status)")
        }
    }
}

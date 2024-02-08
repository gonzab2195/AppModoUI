//
//  Keychain.swift
//  AppModoUI-Tests
//
//  Created by Gonzalo Berro on 08/02/2024.
//

import XCTest
@testable import AppModoUI

final class KeychainTest: XCTestCase {
    
    func testSaveToKeychain_WhenKeyDoesNotExist_AddValue() {
          
        let key = "testKey"
        let value = "testValue"
        
        Keychain.saveToKeychain(key: key, save: value)
        
        let retrievedValue = Keychain.retrieveKeyFromKeychain(key: key)
    
        XCTAssertEqual(retrievedValue, value)
    }
    
    func testSaveToKeychain_WhenKeyExists_UpdateValue() {
          
           let key = "testKey"
           let originalValue = "originalValue"
           let updatedValue = "updatedValue"
           
           Keychain.saveToKeychain(key: key, save: originalValue)
           
           Keychain.saveToKeychain(key: key, save: updatedValue)
           
           let retrievedValue = Keychain.retrieveKeyFromKeychain(key: key)
        
           XCTAssertEqual(retrievedValue, updatedValue)
    }
    
    func testRetrieveKeyFromKeychain_WhenKeyExists_ReturnsValue() {
        
       let key = "testKey"
       let value = "testValue"
       
       Keychain.saveToKeychain(key: key, save: value)
       
       let retrievedValue = Keychain.retrieveKeyFromKeychain(key: key)
       
       XCTAssertEqual(retrievedValue, value)
        
    }
    
    func testRetrieveKeyFromKeychain_WhenKeyDoesNotExist_ReturnsNil() {
        
        let key = "nonExistentKey"
        
       
        let retrievedValue = Keychain.retrieveKeyFromKeychain(key: key)
        
        XCTAssertNil(retrievedValue)
    }
    
    func testDeleteKeyFromKeychain_WhenKeyExists_ReturnsTrue() {
      
        let key = "testKey"
        let value = "testValue"
        
        Keychain.saveToKeychain(key: key, save: value)
        
        let deletionResult = Keychain.deleteKeyFromKeychain(keyToDelete: key)
        
        XCTAssertTrue(deletionResult)
        
        let retrievedValue = Keychain.retrieveKeyFromKeychain(key: key)
        XCTAssertNil(retrievedValue)
    }
        
    func testDeleteKeyFromKeychain_WhenKeyDoesNotExist_ReturnsFalse() {
       
        let nonExistentKey = "nonExistentKey"
       
        let deletionResult = Keychain.deleteKeyFromKeychain(keyToDelete: nonExistentKey)
        
        XCTAssertFalse(deletionResult)
    }
    
    
}

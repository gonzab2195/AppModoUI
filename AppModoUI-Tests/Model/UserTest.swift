//
//  User.swift
//  AppModoUI-Tests
//
//  Created by Gonzalo Berro on 08/02/2024.
//

import XCTest
@testable import AppModoUI

final class UserTest: XCTestCase {
    
    
    func testGetUserInitials(){
        let user = User(id: "",
                        name: "Gonzalo Berro",
                        firstName: "Gonzalo",
                        lastName: "Berro",
                        createdAt: "",
                        phoneNumber: "",
                        dni: "",
                        accounts: [],
                        cards: [],
                        emailValidated: false,
                        email: "",
                        gender: "",
                        identityValidation: false,
                        receiveBenefits: false,
                        memberGetMembersAmount: "",
                        memberGetMembersMaxAmount: "",
                        memberGetMembersUrl: "",
                        suggestedBanks: [],
                        suggestedBanksByCards: [],
                        licensePlates: [],
                        image: "")
        
        XCTAssertEqual(user.userInitials(), "GB")
        XCTAssertNotEqual(user.userInitials(), "BG")
        
    }
    
    func testGetUserFromKeychain() {
           
        let jsonString = "{\"id\": \"1234\", \"name\": \"Daniel Rolon\", \"first_name\": \"Daniel\", \"last_name\": \"Rolon\", \"created_at\": \"2021-09-28T18:09:56.941Z\", \"phone_number\": \"+5492213057172\", \"dni\": \"39549621\", \"accounts\": [], \"cards\": [], \"email_validated\": false, \"email\": \"\", \"gender\": \"M\", \"identity_validation\": true, \"receive_benefits\": false, \"member_get_members_amount\": \"600\", \"member_get_members_max_amount\": \"10000\", \"member_get_members_url\": \"https://assets.mobile.preprod.playdigital.com.ar/images/promotions/member_get_member.png\", \"suggested_banks\": [], \"suggested_banks_by_cards\": [], \"license_plates\": [], \"image\": null}"

            Keychain.saveToKeychain(key: KeychainKeys.ME, save: jsonString)
            
            let user = User.getUserFromKeychain()
            
            XCTAssertNotNil(user) 
            XCTAssertEqual(user?.id, "1234")  
    }
    
    func testGetUser_NotExists() {
        
        let _ = Keychain.deleteKeyFromKeychain(keyToDelete: KeychainKeys.ME)
        
        let user = User.getUserFromKeychain()
        
        XCTAssertNotNil(user)
        XCTAssertEqual(user?.id, "")
    }
    
    
}

//
//  LoginVM.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

protocol LoginVMProtocol {
    var updatePasswordDots: ((String) -> Void)? { get set }
    var showLoginErrorLabel: ((String) -> Void)? { get set }
    var redirectToLogged: (() -> Void)? { get set }
}

class LoginVM: LoginVMProtocol {
    
    //Constants
    
     var passwordLength = 6
   
    //Delegates
    var delegates: LoginVMProtocol?
    var updatePasswordDots: ((String)->Void)?
    var showLoginErrorLabel: ((String) -> Void)?
    var redirectToLogged: (() -> Void)?
    
    //Variables
    
    let name = "Andres Diletto"
    let nameInitials = "AD"
    var password = ""
    var loginTriesLeft = 3
    
    @MainActor
    func handleKeyboardPressed (keypad: Keypad) {
        switch keypad.imageName {
            case .Empty:
                self.handleAddNumber(keypad: keypad)
            case .DeleteArrow:
                self.handleRemoveNumber()
            case .FaceId:
                print("Face id")
        }
    }
    
    @MainActor
    func handleAddNumber(keypad: Keypad){
        
        guard let updatePasswordDots = self.updatePasswordDots,
              let redirectToLogged = self.redirectToLogged else{
            return
        }
        
        if loginTriesLeft == 0 {
            return
        }
        
        if password.count < passwordLength {
            password += keypad.mainText
            updatePasswordDots(password)
        }else{
            return
        }
        
        if password.count == passwordLength {
            Task {
               
                do {
                    let response = try await LoginAPI.shared.doLogin(password: password)
                    
                    guard let accessToken = response.accessToken else {
                        handleErrorLabel()
                        return
                    }
                    
                    if(!accessToken.isEmpty){
                        saveTokenToKeychain(key: KeychainKeys.ACCESS_TOKEN,
                                            save: response.accessToken!)
                        saveTokenToKeychain(key: KeychainKeys.REFRESH_TOKEN,
                                            save: response.refreshToken!)
                      
                        let userInfo = try await UserAPI.shared.getUserInfo()
                        print(userInfo.name ?? "Error")
                        
                        redirectToLogged()
                    }
                 
                }catch let error{
                    print("Fallo el login")
                }
                    
            }
         }
        
    }
    
    func handleRemoveNumber(){
        
        guard let updatePasswordDots = self.updatePasswordDots else{
            return
        }
        
        password = String(password.dropLast())
        
        updatePasswordDots(password)
        
    }
    
    private func handleErrorLabel(){
        
        guard let updatePasswordDots = self.updatePasswordDots,
              let showLoginErrorLabel = self.showLoginErrorLabel else{
            return
        }
        
        loginTriesLeft -= 1
        password = ""
        
        updatePasswordDots(password)
        showLoginErrorLabel("Clave incorrecta. Te quedan \(loginTriesLeft) intentos")
    }
}

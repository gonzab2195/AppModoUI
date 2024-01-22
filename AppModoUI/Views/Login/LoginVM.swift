//
//  LoginVM.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

class LoginVM {
    
    //Constants
    var passwordLength = 6
   
    //Delegates
    var updatePasswordDots: ((String)->Void)?
    var showLoginErrorLabel: ((String) -> Void)?
    var redirectToHome: (() -> Void)?
    
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
    private func handleAddNumber(keypad: Keypad){
       
        guard let updatePasswordDots = self.updatePasswordDots,
              let redirectToHome = self.redirectToHome else{
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
                    try await LoginAPI.shared.doLogin(password: password)
                    
                    try await UserAPI.shared.getUserInfo()
                    
                    redirectToHome()
                    
                }catch let error{
                    
                    handleErrorLabel(message: "Error interno")
                    
                    print(error)
                }
                    
            }
         }
        
    }
    
    private func handleRemoveNumber(){
        
        guard let updatePasswordDots = self.updatePasswordDots else{
            return
        }
        
        password = String(password.dropLast())
        
        updatePasswordDots(password)
        
    }
    
    private func handleErrorLabel(message: String){
        
        guard let updatePasswordDots = self.updatePasswordDots,
              let showLoginErrorLabel = self.showLoginErrorLabel else{
            return
        }
        
        loginTriesLeft -= 1
        password = ""
        
        updatePasswordDots(password)
        showLoginErrorLabel(message)
    }
}

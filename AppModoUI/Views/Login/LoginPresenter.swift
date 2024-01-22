//
//  LoginVM.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import Foundation

protocol LoginPresenterProtocol {
    func updatePasswordDots(password: String) -> Void
    func showLoginErrorLabel(message: String) -> Void
    func redirectToHome() -> Void
}

class LoginPresenter {
    
    //Constants
    var passwordLength = 6
   
    //Delegates
    var delegate: LoginPresenterProtocol?
    
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
        
        guard let delegate = self.delegate else {
            return
        }
                
        if loginTriesLeft == 0 {
            return
        }
        
        if password.count < passwordLength {
            password += keypad.mainText
            delegate.updatePasswordDots(password: password)
        }else{
            return
        }
        
        if password.count == passwordLength {
            Task {
               
                do {
                    try await LoginAPI.shared.doLogin(password: password)
                    
                    try await UserAPI.shared.getUserInfo()
                    
                    delegate.redirectToHome()
                    
                }catch let error{
                    
                    handleErrorLabel(message: "Error interno")
                    print(error)
                }
                    
            }
         }
        
    }
    
    private func handleRemoveNumber(){
        
        guard let delegate = self.delegate else {
            return
        }
        
        password = String(password.dropLast())
        
        delegate.updatePasswordDots(password: password)
        
    }
    
    private func handleErrorLabel(message: String){
        
        guard let delegate = self.delegate else {
            return
        }
        
        loginTriesLeft -= 1
        password = ""
        
        delegate.updatePasswordDots(password: password)
        delegate.showLoginErrorLabel(message: message)
    }
}

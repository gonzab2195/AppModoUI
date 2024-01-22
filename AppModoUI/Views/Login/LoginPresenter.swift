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
}

class LoginPresenter {
    
    //View
    var view: LoginPresenterProtocol?
    
    //Router
    var router = LoginRouter()
    
    //Constants
    let passwordLength = 6
    let name = "Andres Diletto"
    let nameInitials = "AD"
    
    //Variables
    var password = ""
    var loginTriesLeft = 3
    
    init(view: LoginPresenterProtocol){
        self.view = view
    }
    
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
        
        guard let view = self.view else {
            return
        }
                
        if loginTriesLeft == 0 {
            return
        }
        
        if password.count < passwordLength {
            password += keypad.mainText
            view.updatePasswordDots(password: password)
        }else{
            return
        }
        
        if password.count == passwordLength {
            Task {
               
                do {
                    try await LoginAPI.shared.doLogin(password: password)
                    
                    try await UserAPI.shared.getUserInfo()
                    
                    router.navigateToHome(currentView: view)
                    
                }catch let error{
                    
                    handleErrorLabel(message: "Error interno")
                    print(error)
                }
                    
            }
         }
        
    }
    
    private func handleRemoveNumber(){
        
        guard let view = self.view else {
            return
        }
        
        password = String(password.dropLast())
        
        view.updatePasswordDots(password: password)
        
    }
    
    private func handleErrorLabel(message: String){
        
        guard let view = self.view else {
            return
        }
        
        loginTriesLeft -= 1
        password = ""
        
        view.updatePasswordDots(password: password)
        view.showLoginErrorLabel(message: message)
    }
}

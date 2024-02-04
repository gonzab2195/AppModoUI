//
//  LoginVM.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import UIKit

protocol LoginPresenterProtocol {
    func updatePasswordDots(password: String) -> Void
    func showLoginErrorLabel(message: String) -> Void
}

class LoginPresenter {
    
    //View
    let view: LoginPresenterProtocol?
    
    //Use Case
    let loginUseCase = LoginUseCase()
    let meUseCase = MeUseCase()
    
    //Router
    let router: LoginRouterProtocol = LoginRouter()
    
    //Constants
    let passwordLength = 6
    let name = "Daniel Rolon"
    let nameInitials = "DR"
    
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
            handleErrorLabel(message: "Bloqueamos tu clave por seguridad")
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
                    loginTriesLeft -= 1
                    try await loginUseCase.doLogin(password: password)
                    
                    try await meUseCase.getMe()
                                        
                    router.navigateToHome(currentView: view as! UIViewController)
                    
                }catch let error{
                    let errorDecoded = error as NSError
                    
                    if let errorMessage = InternalCodes.getInternalMessage(
                        internalMessage: errorDecoded.domain, toReplace: String(loginTriesLeft)) {
                        handleErrorLabel(message: errorMessage)
                        return
                    }
                    
                    if(errorDecoded.code == ErrorCodes.UNAUTHORIZED.rawValue){
                        return
                    }
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
        
        password = ""
        
        view.updatePasswordDots(password: password)
        view.showLoginErrorLabel(message: message)
    }
}

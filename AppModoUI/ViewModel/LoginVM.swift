//
//  LoginVM.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 18/01/2024.
//

import UIKit

struct LoginVM {
    
    var loginTriesLeft = 3
    var password = ""
    
    
    func handlePasswordChange(keypad: Keypad, errorLabel: UILabel, passwordDots: PasswordDots){
        
        if loginTriesLeft == 0 {
            return
        }
        
        errorLabel.isHidden = true
        
        if password.count < passwordDots.passwordLength! {
            self.password = self.password + keypad.mainText
            passwordDots.updatePasswordDots(password: password)
        }else{
            return
        }
        
       if password.count == passwordDots.passwordLength! {
           Task {
               do {
                   let response = try await LoginAPI.shared.doLogin(password: password)
                   
                   guard let accessToken = response.accessToken else {
                       errorOnLogin()
                       return
                   }
                   
                   if(!accessToken.isEmpty){
                       saveTokenToKeychain(key: KeychainKeys.ACCESS_TOKEN,
                                           save: response.accessToken!)
                       saveTokenToKeychain(key: KeychainKeys.REFRESH_TOKEN,
                                           save: response.refreshToken!)
                     
                       let userInfo = try await UserAPI.shared.getUserInfo()
                       print(userInfo.name ?? "Error")
                       redirectToStoryboard(currentView: self,
                                            storyboardID: StoryboardNames.HOME_STORYBOARD,
                                            viewControllerID: ViewControllerNames.HOME_VIEW)
                   }
                
               }catch{
                   print("Fallo el login")
               }
           }
        }
    }
    
    
    
}

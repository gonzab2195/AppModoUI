//
//  Biometrics.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import Foundation
import LocalAuthentication

class Biometrics {
    
    func useBiometric(successAction: @escaping () -> Void = {}){
        
        let context = LAContext()
        var error: NSError? = nil
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            let reason = "Permitir uso de autenticación biométrica"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { success, error in
              
              
                guard success, error == nil else {
                    print("Error al activar")
                    return
                }
                
                    successAction()
                    
                }
                
            
            
        } else {
            print("Error al activar datos biometricos")
        }
        
    }
    
}

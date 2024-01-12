//
//  Keypad.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class KeypadComponent {
    
    let superView: UIView
    let buttonsAmount = 12
    
    init(superView: UIView) {
        self.superView = superView
    }
    
    func createKeypad(){
        var xCount = 0
        var yCount = 0
        
        for _ in 0..<buttonsAmount {
            
            KeypadButtonContainer(superView: superView, x: xCount, y: yCount).configureButton()
        
            yCount = xCount == 2 ? yCount + 1 : yCount
            xCount = xCount == 2 ? 0 : xCount + 1
            
        }
        
    }
    
    
}


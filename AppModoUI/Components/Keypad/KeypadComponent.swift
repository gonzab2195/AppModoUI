//
//  Keypad.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

final class KeypadComponent {
    
    private let superView: UIView
    private let buttonsAmount = 12
    
    init(superView: UIView) {
        self.superView = superView
    }
    
    func createKeypad(){
        var xCount = 0
        var yCount = 0
        let buttonWidth = superView.frame.width / 3
        for _ in 0..<buttonsAmount {
            
            let buttonContainer = KeypadButtonContainer(keypad: keypadArray[(yCount*3)+xCount])
            
            superView.addSubview(buttonContainer)
            
            let leftAnchor : CGFloat = CGFloat(buttonWidth * Double(xCount))
            let topAnchor: CGFloat = CGFloat(50 * (yCount))
            
            NSLayoutConstraint.activate([
                buttonContainer.widthAnchor.constraint(equalToConstant: CGFloat(buttonWidth)),
                buttonContainer.heightAnchor.constraint(equalToConstant: 40),
                buttonContainer.topAnchor.constraint(equalTo: superView.topAnchor, constant: topAnchor),
                buttonContainer.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: leftAnchor)
            
            ])
            
            yCount = xCount == 2 ? yCount + 1 : yCount
            xCount = xCount == 2 ? 0 : xCount + 1
            
        }
        
    }
    
    
}


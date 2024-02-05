//
//  Keypad.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

final class KeypadComponent {
    
    private let superView: UIView
    
    init(superView: UIView) {
        self.superView = superView
    }
    
    func createKeypad(){
        
        let buttonRow1 = KeypadButtonContainer(keypads: Array(keypadArray.prefix(3)))
        let buttonRow2 = KeypadButtonContainer(keypads: Array(keypadArray.suffix(from: 3).prefix(3)))
        let buttonRow3 = KeypadButtonContainer(keypads: Array(keypadArray.suffix(from: 6).prefix(3)))
        let buttonRow4 = KeypadButtonContainer(keypads: Array(keypadArray.suffix(3)))
        
        superView.addSubview(buttonRow1)
        superView.addSubview(buttonRow2)
        superView.addSubview(buttonRow3)
        superView.addSubview(buttonRow4)
        
        NSLayoutConstraint.activate([
            buttonRow1.widthAnchor.constraint(equalTo: superView.widthAnchor),
            buttonRow1.heightAnchor.constraint(equalToConstant: 40),
            buttonRow1.topAnchor.constraint(equalTo: superView.topAnchor),
            buttonRow1.leftAnchor.constraint(equalTo: superView.leftAnchor),
            
            buttonRow2.widthAnchor.constraint(equalTo: superView.widthAnchor),
            buttonRow2.heightAnchor.constraint(equalToConstant: 40),
            buttonRow2.topAnchor.constraint(equalTo: buttonRow1.bottomAnchor, constant: 10),
            buttonRow2.leftAnchor.constraint(equalTo: buttonRow1.leftAnchor),
            
            buttonRow3.widthAnchor.constraint(equalTo: superView.widthAnchor),
            buttonRow3.heightAnchor.constraint(equalToConstant: 40),
            buttonRow3.topAnchor.constraint(equalTo: buttonRow2.bottomAnchor, constant: 10),
            buttonRow3.leftAnchor.constraint(equalTo: buttonRow2.leftAnchor),
            
            buttonRow4.widthAnchor.constraint(equalTo: superView.widthAnchor),
            buttonRow4.heightAnchor.constraint(equalToConstant: 40),
            buttonRow4.topAnchor.constraint(equalTo: buttonRow3.bottomAnchor, constant: 10),
            buttonRow4.leftAnchor.constraint(equalTo: buttonRow3.leftAnchor)
        
        ])
        
    }
    
    
}


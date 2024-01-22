//
//  KeypadButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

final class KeypadButtonContainer: UIView {
    
    private var keypad: Keypad?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(keypad: Keypad) {
        super.init(frame: .zero)
        self.keypad = keypad
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButton(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        configureButtonContent()

    }
    
    func configureButtonContent(){
        
        guard let keypad = self.keypad else {
            return
        }
        
        let keypadButton = KeypadButton(keypad: keypad)
        
        self.addSubview(keypadButton)
        self.bringSubviewToFront(keypadButton)
        
        NSLayoutConstraint.activate([
            keypadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
            keypadButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            keypadButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            keypadButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5)
        ])
    }

}

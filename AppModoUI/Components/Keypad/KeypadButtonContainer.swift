//
//  KeypadButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

final class KeypadButtonContainer: UIStackView {
    
    private var keypads: [Keypad]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(keypads: [Keypad]) {
        super.init(frame: .zero)
        self.keypads = keypads
        self.configureButton()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureButton(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.spacing = 10
        self.distribution = .fillEqually
        
        self.configureButtonContent()

    }
    
    private func configureButtonContent(){
        
        if keypads == nil || keypads!.count < 3 {
            print(keypads?.count ?? "Error")
            return
        }
        
        let keypadButton1 = KeypadButton(keypad: keypads![0])
        let keypadButton2 = KeypadButton(keypad: keypads![1])
        let keypadButton3 = KeypadButton(keypad: keypads![2])
        
        self.addArrangedSubview(keypadButton1)
        self.addArrangedSubview(keypadButton2)
        self.addArrangedSubview(keypadButton3)
    }

}

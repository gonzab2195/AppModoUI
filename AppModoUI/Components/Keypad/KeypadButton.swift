//
//  KeypadContent.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

final class KeypadButton: UIButton {

    private var keypad: Keypad?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    init(keypad: Keypad) {
        super.init(frame: .zero)
        self.keypad = keypad
        self.configure()
    }
    
    private func configure(){
        
        guard let keypad = self.keypad else {
            return
        }

        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
        self.layer.cornerRadius = 5
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(KeypadButton.buttonTapped(sender:)), for: .touchUpInside)

        if(keypad.imageName != KeypadImages.Empty){
            self.setImage(UIImage(named: keypad.imageName.rawValue), for: .normal)
        }else{
            let buttonContent = NumberPad(keypad: keypad)
            self.addSubview(buttonContent)
            
            NSLayoutConstraint.activate([
                buttonContent.topAnchor.constraint(equalTo: self.topAnchor),
                buttonContent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                buttonContent.leftAnchor.constraint(equalTo: self.leftAnchor),
                buttonContent.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
            
            self.sendSubviewToBack(buttonContent)
        }
    }
    
    @objc func buttonTapped(sender: UIButton) {
        let observerName = Notification.Name(ObserversNames.KEYPAD_BUTTON_PRESSED)
        NotificationCenter.default.post(name: observerName, object: keypad)
    }

    

}

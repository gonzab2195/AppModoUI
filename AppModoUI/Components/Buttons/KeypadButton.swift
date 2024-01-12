//
//  KeypadContent.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class KeypadButton: UIButton {

    var superView: UIView?
    var keypad: Keypad?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    init(superView : UIView, keypad: Keypad) {
        super.init(frame: .zero)
        self.superView = superView
        self.keypad = keypad
    }
    
    func configure(){
        
        guard let superView = superView, let keypad = self.keypad else {
            return
        }

        self.backgroundColor = UIColor(named: Colors.SECONDARY_GRAY_3)
        self.layer.cornerRadius = 5
        
        if(keypad.imageName != KeypadImages.Empty){
            self.setImage(UIImage(named: keypad.imageName.rawValue), for: .normal)
        }else{
            NumberPad(superView: self, keypad: keypad).configureNumberPad()
        }
       
        self.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)

        
        superView.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 5),
            self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -5),
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: 5),
            self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 5)
        ])
        
        
    }
    
    @objc func buttonTapped(sender: UIButton) {
        print("prueba")
    }

    

}

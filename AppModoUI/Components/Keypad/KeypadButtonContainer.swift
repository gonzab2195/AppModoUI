//
//  KeypadButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class KeypadButtonContainer: UIView {
    
    var x: Int?
    var y: Int?
    var superView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(superView: UIView, x: Int, y: Int) {
        super.init(frame: .zero)
        self.x = x
        self.y = y
        self.superView=superView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButton(){
        
        guard let superView = superView else {
            return
        }
        
        let buttonsSpace = Double(superView.frame.width / 3);
        
        superView.addSubview(self)
        
        let leftAnchor : CGFloat = CGFloat(buttonsSpace * Double(x ?? 0))
        let topAnchor: CGFloat = CGFloat(50 * (y ?? 0))
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: CGFloat(buttonsSpace)),
            self.heightAnchor.constraint(equalToConstant: 40),
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: topAnchor),
            self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: leftAnchor)
        
        ])
        
        configureButtonContent()

    }
    
    func configureButtonContent(){
        
        guard let x = self.x, let y = self.y else {
            return
        }
        
        KeypadButton(superView: self, keypad: keypadArray[(y*3)+x]).configure()
        
    }

}

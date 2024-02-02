//
//  PasswordDots.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

final class PasswordDots: PasswordEyeButtonDelegate {
    
    private let emptyDotColor = UIColor(named: Colors.SECONDARY_GRAY_8)
    private let filledDotColor = UIColor(named: Colors.PAYMENT_DEFAULT)
    private var password = ""
    
    private let passwordLength: Int?
    private let superView: UIStackView?
    private let eyeButton: PasswordEyeButton?
    
    var passwordShown = false
    
    init(superView: UIStackView, passwordLength: Int) {
        self.superView = superView
        self.passwordLength = passwordLength
        self.eyeButton = PasswordEyeButton(superView: superView)
    }
    
    func onEyeButtonPressed() {
        updatePasswordDots(password: password)
    }
    
    func createPasswordDots(){
        
        guard let superView = superView, let passwordLength = self.passwordLength else {
            return
        }
        
        superView.alignment = .center
        superView.axis = .horizontal
        superView.spacing = 5
        superView.distribution = .equalCentering
        
        eyeButton?.delegate = self
        
        for i in 0..<passwordLength {
            
            createDot(circleNumber:i)
            
        }
        
        eyeButton!.createEyeButton()
        
    }
    
    func updatePasswordDots(password:String){
        
        guard let superView = superView, let _ = self.passwordLength else {
            return
        }
        
        self.password = password
        
        for subview in superView.subviews {
            subview.removeFromSuperview()
        }
       
       self.createPasswordDots()
    }
    
    private func createDot(circleNumber: Int){
        
        guard let superView = superView, let eyeButton = self.eyeButton else {
            return
        }
        
        let circle = UILabel()
        
        if eyeButton.showingPassword && password.count > circleNumber {
            let letterIndex = password.index(password.startIndex, offsetBy: circleNumber)
            circle.text = String(password[letterIndex])
            circle.textAlignment = .center
            circle.backgroundColor = .clear
        }else{
            circle.backgroundColor = password.count > circleNumber ? filledDotColor : emptyDotColor
            circle.layer.cornerRadius = 7
            circle.clipsToBounds = true
        }
        
        circle.widthAnchor.constraint(equalToConstant: 16).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 16).isActive = true
       
        superView.addArrangedSubview(circle)
        
        
    }
    
    
    

}

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
    
    let passwordLength: Int?
    let superView: UIView?
    let eyeButton: PasswordEyeButton?

    var passwordShown = false
    
    init(superView: UIView, passwordLength: Int) {
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
       
        createPasswordDots()
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
       
        
        superView.addSubview(circle)
        
        circle.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            circle.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor, constant: CGFloat(circleNumber * 36)),
            circle.widthAnchor.constraint(equalToConstant: 16),
            circle.heightAnchor.constraint(equalToConstant: 16),
            circle.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
            
        ])
        
        
    }
    
    
    

}

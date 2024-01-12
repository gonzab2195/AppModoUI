//
//  PasswordDots.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class PasswordDots {
    
    let emptyDotColor = UIColor(named: Colors.SECONDARY_GRAY_8)
    let circle1 = UIView()
    let circle2 = UIView()
    let circle3 = UIView()
    let circle4 = UIView()
    let circle5 = UIView()
    let circle6 = UIView()
    let eyeButton = UIButton()
    
    let superView: UIView?
    
    init(superView: UIView) {
        self.superView = superView
    }
    
    func createPasswordDots(){
        
        createFirstCircle()
        
        createOtherDots(currentCircle: circle2, leftCircle: circle1)
        createOtherDots(currentCircle: circle3, leftCircle: circle2)
        createOtherDots(currentCircle: circle4, leftCircle: circle3)
        createOtherDots(currentCircle: circle5, leftCircle: circle4)
        createOtherDots(currentCircle: circle6, leftCircle: circle5)
        
        guard let superView = superView else {
            return
        }
        
        PasswordEyeButton(superView: superView, leftCircle: circle6).createEyeButton()
    }
    
    private func createFirstCircle(){
        
        guard let superView = superView else {
            return
        }
        
        superView.addSubview(circle1)
        
        circle1.translatesAutoresizingMaskIntoConstraints = false
        circle1.backgroundColor = emptyDotColor
      
        NSLayoutConstraint.activate([
            circle1.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor, constant: 0),
            circle1.widthAnchor.constraint(equalToConstant: 13),
            circle1.heightAnchor.constraint(equalToConstant: 13),
            circle1.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
            
        ])
        
        circle1.layer.cornerRadius = 6.5
        circle1.clipsToBounds = true
    }
    
    private func createOtherDots(currentCircle: UIView, leftCircle: UIView){
        
        guard let superView = superView else {
            return
        }
        
        superView.addSubview(currentCircle)
        
        currentCircle.translatesAutoresizingMaskIntoConstraints = false
        currentCircle.backgroundColor = emptyDotColor
      
        NSLayoutConstraint.activate([
            currentCircle.leftAnchor.constraint(equalTo: leftCircle.rightAnchor, constant: 20),
            currentCircle.widthAnchor.constraint(equalToConstant: 13),
            currentCircle.heightAnchor.constraint(equalToConstant: 13),
            currentCircle.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
        ])
        
        currentCircle.layer.cornerRadius = 6.5
        currentCircle.clipsToBounds = true
    }
    

}

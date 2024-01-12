//
//  PasswordEyeButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class PasswordEyeButton: UIButton {

    var superView: UIView?
    var leftCircle: UIView?
    
    init(superView : UIView, leftCircle: UIView) {
        super.init(frame: .zero)
        self.superView = superView
        self.leftCircle = leftCircle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createEyeButton(){
        
        guard let superView = superView, let leftCircle = self.leftCircle else {
            return
        }
                
        self.setImage(UIImage(named: "eye-open"), for: .normal)
        
        self.isUserInteractionEnabled = true
        superView.isUserInteractionEnabled = true

        self.addTarget(self, action: #selector(imageTapped(sender:)), for: .touchUpInside)
        
        superView.addSubview(self)
        
        superView.bringSubviewToFront(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: leftCircle.rightAnchor, constant: 15),
            self.widthAnchor.constraint(equalToConstant: 35),
            self.heightAnchor.constraint(equalToConstant: 35),
            self.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ])
    }
    
    
    @objc func imageTapped(sender: UIButton) {
       
        if(sender.currentImage == UIImage(named: "eye-open")){
            sender.setImage(UIImage(named: "eye-close"), for: .normal)

        }else{
            sender.setImage(UIImage(named: "eye-open"), for: .normal)
        }
    }

}

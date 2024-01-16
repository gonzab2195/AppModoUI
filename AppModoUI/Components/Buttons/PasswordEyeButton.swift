//
//  PasswordEyeButton.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

protocol PasswordEyeButtonDelegate {
    func onEyeButtonPressed()
}

class PasswordEyeButton: UIButton {

    let showPasswordImage = "eye-open"
    let hidePasswordImage = "eye-close"
    var showingPassword = false
    var superView: UIView?
    
    var delegate: PasswordEyeButtonDelegate?
        
    init(superView : UIView) {
        super.init(frame: .zero)
        self.superView = superView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createEyeButton(){
        
        guard let superView = superView else {
            return
        }
                
        self.setImage(UIImage(named: showingPassword ? hidePasswordImage : showPasswordImage), for: .normal)
        
        self.isUserInteractionEnabled = true
        superView.isUserInteractionEnabled = true

        self.addTarget(self, action: #selector(imageTapped(sender:)), for: .touchUpInside)
        
        superView.addSubview(self)
        
        superView.bringSubviewToFront(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor, constant: CGFloat((36 * 5) + 25)),
            self.widthAnchor.constraint(equalToConstant: 35),
            self.heightAnchor.constraint(equalToConstant: 35),
            self.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ])
    }
    
    
    @objc func imageTapped(sender: UIButton) {
       
        if(sender.currentImage == UIImage(named: showPasswordImage)){
            sender.setImage(UIImage(named: hidePasswordImage), for: .normal)
            showingPassword = true
        }else{
            sender.setImage(UIImage(named: showPasswordImage), for: .normal)
            showingPassword = false
        }
        delegate?.onEyeButtonPressed()
    }

}

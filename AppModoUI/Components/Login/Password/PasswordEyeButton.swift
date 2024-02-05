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

final class PasswordEyeButton: UIButton {

    private let showPasswordImage = UIImage(named: "eyeCloseIcon")!.resized(toWidth: 35)
    private let hidePasswordImage = UIImage(named: "eyeOpenIcon")!.resized(toWidth: 20)
    var showingPassword = false
    private var superView: UIStackView?
    
    var delegate: PasswordEyeButtonDelegate?
        
    init(superView : UIStackView) {
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
                        
        let iconImage = showingPassword ? hidePasswordImage : showPasswordImage
        self.setImage(iconImage, for: .normal)
        
        self.isUserInteractionEnabled = true
        superView.isUserInteractionEnabled = true

        self.addTarget(self, action: #selector(imageTapped(sender:)), for: .touchUpInside)
        
        self.widthAnchor.constraint(equalToConstant: 35).isActive = true
        self.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        superView.addArrangedSubview(self)
        
    }
    
    @objc func imageTapped(sender: UIButton) {
        if(!showingPassword){
            sender.setImage(hidePasswordImage, for: .normal)
            showingPassword = true
        }else{
            sender.setImage(showPasswordImage, for: .normal)
            showingPassword = false
        }
        delegate?.onEyeButtonPressed()
    }

}

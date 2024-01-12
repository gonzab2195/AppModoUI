//
//  LoginVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var avatarCircle: UIView!
    @IBOutlet weak var userInitialsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordInputLabel: UILabel!
    @IBOutlet weak var passwordDotsContainer: UIView!
    @IBOutlet weak var keypadView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureAvatarCircle()
        configureUserInitialsLabel()
        configureUsernameLabel()
        
        PasswordDots(superView: passwordDotsContainer)
            .createPasswordDots()
        
        KeypadComponent(superView: keypadView).createKeypad()
    }
    
    func configureAvatarCircle() {
        
        avatarCircle.layer.cornerRadius = avatarCircle.frame.size.width / 2
        avatarCircle.backgroundColor = UIColor(named: Colors.SECONDARY_PAYMENT_10)
        avatarCircle.clipsToBounds = true
    }
    
    func configureUserInitialsLabel() {
        
        userInitialsLabel.text = "GB"
        userInitialsLabel.textColor = UIColor(named: Colors.PAYMENT_DARK)
        userInitialsLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        
    }
    
    func configureUsernameLabel() {
        
        usernameLabel.text = "Gonzalo Berro"
        usernameLabel.textColor = .black
        usernameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
    }
}

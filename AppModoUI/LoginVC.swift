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
    
    private var passwordDots:PasswordDots?
    private var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAvatarCircle()
        configureUserInitialsLabel()
        configureUsernameLabel()
        
        passwordDots = PasswordDots(superView: passwordDotsContainer, passwordLength: 6)
        passwordDots!.createPasswordDots()
        
        KeypadComponent(superView: keypadView).createKeypad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keypadPressed(notification:)), name: Notification.Name(ObserversNames.KEYPAD_BUTTON_PRESSED), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
    
    @objc func keypadPressed(notification: NSNotification){
        
        if let keypad:Keypad = notification.object as? Keypad {
            
            switch keypad.imageName {
                
            case .Empty:
                if password.count < passwordDots!.passwordLength! {
                    password += keypad.mainText
                    passwordDots?.updatePasswordDots(password: password)
                }
            case .DeleteArrow:
                password = String(password.dropLast())
                passwordDots?.updatePasswordDots(password: password)
            case .FaceId:
                print("Face id")
            }
           
        }
        
       
    }
}

//
//  LoginVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class LoginVC: ViewManager, LoginPresenterProtocol {
    
    //Presenter
    private var loginVM: LoginPresenter?
    
    @IBOutlet weak var avatarCircle: UIView!
    @IBOutlet weak var userInitialsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordInputLabel: UILabel!
    @IBOutlet weak var passwordDotsContainer: UIView!
    @IBOutlet weak var keypadView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var passwordDots: PasswordDots?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Navigation.hideNavigationBar(view: self)
        
        loginVM = LoginPresenter(view: self)
        
        configureAvatarCircle()
        configureUserInitialsLabel()
        configureUsernameLabel()
        configurePassword()
        configureKeypad()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //UI
    
    func configureAvatarCircle() {
        
        avatarCircle.layer.cornerRadius = avatarCircle.frame.size.width / 2
        avatarCircle.backgroundColor = UIColor(named: Colors.SECONDARY_PAYMENT_10)
        avatarCircle.clipsToBounds = true
    }
    
    func configureUserInitialsLabel() {
        
        userInitialsLabel.text = loginVM!.nameInitials
        userInitialsLabel.textColor = UIColor(named: Colors.PAYMENT_DARK)
        userInitialsLabel.font = .systemFont(ofSize: 19, weight: .semibold)
    }
    
    func configureUsernameLabel() {
        
        usernameLabel.text = loginVM!.name
        usernameLabel.textColor = .black
        usernameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    func configurePassword(){
        passwordDots = PasswordDots(superView: passwordDotsContainer, passwordLength: loginVM!.passwordLength)
        passwordDots!.createPasswordDots()
    }
    
    func configureKeypad(){
        KeypadComponent(superView: keypadView).createKeypad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.keypadPressed(notification:)), name: Notification.Name(ObserversNames.KEYPAD_BUTTON_PRESSED), object: nil)
    }
    
    func errorOnLogin(message: String){
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
    //Functions
    
    func updatePasswordDots(password: String) {
        self.passwordDots?.updatePasswordDots(password: password)
    }
    
    func showLoginErrorLabel(message: String){
        self.errorOnLogin(message: message)
    }
    
    @objc func keypadPressed(notification: NSNotification){
        
        errorLabel.isHidden = true
        
        if let keypad:Keypad = notification.object as? Keypad {
            
            loginVM!.handleKeyboardPressed(keypad: keypad)
           
        }
    }
    
    
}

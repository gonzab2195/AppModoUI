//
//  LoginVC.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class LoginVC: ViewManager, LoginPresenterProtocol {
    
    @IBOutlet weak var avatarCircle: UIView!
    @IBOutlet weak var userInitialsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordInputLabel: UILabel!
    @IBOutlet weak var passwordDotsContainer: UIView!
    @IBOutlet weak var keypadView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var passwordDots: PasswordDots?
    private var loginVM = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Navigation.hideNavigationBar(view: self)
        
        configureAvatarCircle()
        configureUserInitialsLabel()
        configureUsernameLabel()
        
        passwordDots = PasswordDots(superView: passwordDotsContainer, passwordLength: loginVM.passwordLength)
        passwordDots!.createPasswordDots()
        
        KeypadComponent(superView: keypadView).createKeypad()
        
        loginVM.delegate = self
        
        /*loginVM.updatePasswordDots = { self.passwordDots?.updatePasswordDots(password: $0) }
        loginVM.showLoginErrorLabel = { self.errorOnLogin(message: $0) }
        loginVM.redirectToHome = { Navigation.redirectToStoryboard(currentView: self,
                                                        storyboardID: StoryboardNames.HOME_STORYBOARD,
                                                        viewControllerID: ViewControllerNames.HOME_VIEW) }*/
        //loginVM.redirectToHome!()
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
        
        userInitialsLabel.text = loginVM.nameInitials
        userInitialsLabel.textColor = UIColor(named: Colors.PAYMENT_DARK)
        userInitialsLabel.font = .systemFont(ofSize: 19, weight: .semibold)
    }
    
    func configureUsernameLabel() {
        
        usernameLabel.text = loginVM.name
        usernameLabel.textColor = .black
        usernameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    func errorOnLogin(message: String){
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
    func updatePasswordDots(password: String) {
        self.passwordDots?.updatePasswordDots(password: password)
    }
    
    func showLoginErrorLabel(message: String){
        self.errorOnLogin(message: message)
    }
    
    func redirectToHome(){
        Navigation.redirectToStoryboard(currentView: self,
                                        storyboardID: StoryboardNames.HOME_STORYBOARD,
                                        viewControllerID: ViewControllerNames.HOME_VIEW)
    }
    
    @objc func keypadPressed(notification: NSNotification){
        
        errorLabel.isHidden = true
        
        if let keypad:Keypad = notification.object as? Keypad {
            
            loginVM.handleKeyboardPressed(keypad: keypad)
           
        }
    }
    
    
}

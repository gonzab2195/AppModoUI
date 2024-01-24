//
//  ButtonWithImage.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

class ButtonWithImage: UIButton {
    
    var title: String = ""
    var image: UIImage?
    var buttonColor: UIColor = UIColor(named: Colors.PAYMENT_DEFAULT)!
    var borderColor: UIColor = .white
    var textColor: UIColor = .white
    var fontSize: Float = 15
    
    init(buttonColor: UIColor, title: String, textColor: UIColor, fontSize: Float, image: UIImage?, borderColor: UIColor){
        super.init(frame: .zero)
        self.buttonColor = buttonColor
        self.title = title
        self.image = image
        self.borderColor = borderColor
        self.textColor = textColor
        self.fontSize = fontSize
        configure()
    }
    
    init(buttonColor: UIColor, title: String, textColor: UIColor, fontSize: Float, image: UIImage?){
        super.init(frame: .zero)
        self.buttonColor = buttonColor
        self.image = image
        self.title = title
        self.textColor = textColor
        self.fontSize = fontSize
        configure()
    }
    
    init(buttonColor: UIColor, title: String, textColor: UIColor, fontSize: Float){
        super.init(frame: .zero)
        self.buttonColor = buttonColor
        self.title = title
        self.textColor = textColor
        self.fontSize = fontSize
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        self.backgroundColor = buttonColor
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .semibold)

        self.setTitleColor(textColor, for: .normal)
        
        if image != nil {
            let image = image!.resized(toWidth: 30.0) // Adjust the width as needed
            self.setImage(image, for: .normal)
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
        
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 17
        self.tintColor = textColor
        
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor.cgColor

    }
}

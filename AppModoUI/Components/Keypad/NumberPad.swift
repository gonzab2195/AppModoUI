//
//  NumberPad.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

final class NumberPad: UIView {

    private var keypad: Keypad?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(keypad: Keypad){
        super.init(frame: .zero)
        self.keypad = keypad
        configureNumberPad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNumberPad(){
        
        guard let keypad = self.keypad else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
        
        let titleLabel = UILabel()
        let subTitle = UILabel()
        
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        titleLabel.textColor = .black
        titleLabel.text = keypad.mainText
        titleLabel.textAlignment = .center
        
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,
                                                constant: keypad.subText.isEmpty ? 0 : -5),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        if(!keypad.subText.isEmpty) {
            
            subTitle.font = .systemFont(ofSize: 10, weight: .semibold)
            subTitle.textColor = .black
            subTitle.text = keypad.subText
            subTitle.textAlignment = .center

            self.addSubview(subTitle)
                                 
            subTitle.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                subTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                subTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
                subTitle.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
            
        }
    }
    
    
    
}

//
//  NumberPad.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 11/01/2024.
//

import UIKit

class NumberPad: UIView {

    var superView: UIView?
    var keypad: Keypad?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(superView: UIView, keypad: Keypad){
        super.init(frame: .zero)
        self.superView = superView
        self.keypad = keypad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNumberPad(){
        
        guard let superView = self.superView, let keypad = self.keypad else {
            return
        }
        
        let titleLabel = UILabel()
        let subTitle = UILabel()
        
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        titleLabel.textColor = .black
        titleLabel.text = keypad.mainText
        titleLabel.textAlignment = .center
        
        superView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: superView.centerYAnchor,
                                                constant: keypad.subText.isEmpty ? 0 : -5),
            titleLabel.widthAnchor.constraint(equalTo: superView.widthAnchor)
        ])
        
        if(!keypad.subText.isEmpty) {
            
            subTitle.font = .systemFont(ofSize: 10, weight: .semibold)
            subTitle.textColor = .black
            subTitle.text = keypad.subText
            subTitle.textAlignment = .center

            superView.addSubview(subTitle)
                                 
            subTitle.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                subTitle.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
                subTitle.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: 10),
                subTitle.widthAnchor.constraint(equalTo: superView.widthAnchor)
            ])
            
        }
    }
    
    
    
}

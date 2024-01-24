//
//  Title.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

class HomeTitle: UILabel {
    
    init(title: String){
        super.init(frame: .zero)
        self.configure(title: title)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(title: String){
        
        self.text = title
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor(named: Colors.SECONDARY_GRAY_40)
        self.font = .systemFont(ofSize: 15, weight: .bold)
        
    }
}

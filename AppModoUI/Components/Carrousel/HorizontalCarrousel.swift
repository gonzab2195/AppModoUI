//
//  HorizontalCarrousel.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 21/01/2024.
//

import UIKit

class HorizontalCarrousel: UIView {
    
    private var elementsWidth: Double?
    private var elementsArray: [UIView]?
    private var spaceBetween: Double?
    private var initialPadding: Double?
    
    init(elementsWidth: Double, spaceBetween: Double, initialPadding: Double, elementsArray: [UIView]){
        super.init(frame: .zero)
        self.elementsWidth = elementsWidth
        self.spaceBetween = spaceBetween
        self.elementsArray = elementsArray
        self.initialPadding = initialPadding
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
       
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView)
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        let contentViewWidthAnchor = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        
        contentViewWidthAnchor.isActive = true
        contentViewWidthAnchor.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
           scrollView.topAnchor.constraint(equalTo: self.topAnchor),
           scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
           scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
           
           contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
           contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
           contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
           contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
           contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
           
        ])
        
        guard let elementsWidth = self.elementsWidth, 
              let spaceBetween = self.spaceBetween,
              let initialPadding = self.initialPadding,
              let elementsArray = self.elementsArray else {
            return
        }
        
        for (index, element) in elementsArray.enumerated() {
            
            element.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(element)
            
            NSLayoutConstraint.activate([
                element.topAnchor.constraint(equalTo: contentView.topAnchor),
                element.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                element.heightAnchor.constraint(equalTo: contentView.heightAnchor),
                element.widthAnchor.constraint(equalToConstant: elementsWidth),
            ])
            
            if(index == 0){
                NSLayoutConstraint.activate([
                    element.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: initialPadding),
                ])
            }else{
                NSLayoutConstraint.activate([
                    element.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat((elementsWidth + spaceBetween) * Double(index)) + initialPadding),
                ])
            }
            
            if(index + 1 == elementsArray.count){
                NSLayoutConstraint.activate([
                    element.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100)
                ])
            }
            
        }
    }
    
}

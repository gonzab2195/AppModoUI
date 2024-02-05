//
//  TestCell.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 24/01/2024.
//

import UIKit

class CarrouselCell: UICollectionViewCell {
    
    static let identifier = "TestCell"
    
    private var carrouselElement: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    func configure(cellContent: UIView) {
        carrouselElement = cellContent

        self.addSubview(carrouselElement)
        carrouselElement.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carrouselElement.topAnchor.constraint(equalTo: self.topAnchor),
            carrouselElement.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrouselElement.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrouselElement.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //self.carrouselElement = nil
    }
    
}

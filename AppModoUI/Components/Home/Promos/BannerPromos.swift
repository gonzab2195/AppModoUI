//
//  BannerPromos.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

class BannerPromos: UIImageView {
    
    private var bannerImage: String?
    
    init(bannerImage: String){
        super.init(frame: .zero)
        self.bannerImage = bannerImage
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        guard let bannerImage = self.bannerImage else {
            return
        }
        
        self.imageFrom(url: URL(string: bannerImage)!)
        
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 35
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
    }
    
}

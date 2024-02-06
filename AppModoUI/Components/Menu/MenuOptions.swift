//
//  MenuOptions.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 05/02/2024.
//

import UIKit

class MenuOptions: UIView {
    
    init(){
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
                
        let option1 = MenuOption(image: UIImage(named: "gearIcon")!, text: "Configuración") {}
        let option2 = MenuOption(image: UIImage(named: "qrIcon")!, text: "QR Personal") {}
        let option3 = MenuOption(image: UIImage(named: "donateIcon")!, text: "Donar con MODO") {}
        let option4 = MenuOption(image: UIImage(named: "headphonesIcon")!, text: "¿Necesitas ayuda?") {}
        let option5 = MenuOption(image: UIImage(named: "rechargeIcon")!, text: "Invitar amigos") {}
        let option6 = MenuOption(image: UIImage(named: "recommendIcon")!, text: "Ayudanos a mejorar") {}
        let option7 = MenuOption(image: UIImage(named: "alertIcon")!, text: "Legales") {}
        let option8 = MenuOption(image: UIImage(named: "closeSessionIcon")!, text: "Cerrar Sesión",
                                 tintColor: UIColor(named: Colors.ERROR_DARK)!) { NetworkManager.logOut() }
        
        let carrousel = Carrousel(carrouselElements:
                                    [option1,option2,option3,option4, option5, option6, option7, option8],
                  elementsSize: CGSize(width: self.frame.width, height: 65),
                  spaceBetween: 0,
                  initialPadding: 20,
                  axis: .vertical)
        
        self.addSubview(carrousel)
        
        NSLayoutConstraint.activate([
            carrousel.topAnchor.constraint(equalTo: self.topAnchor),
            carrousel.leftAnchor.constraint(equalTo: self.leftAnchor),
            carrousel.rightAnchor.constraint(equalTo: self.rightAnchor),
            carrousel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}


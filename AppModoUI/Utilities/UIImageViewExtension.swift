//
//  UIImageFromUrl.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 10/01/2024.
//

import UIKit
import PocketSVG

extension UIImageView{
    func imageFrom(url:URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data:data){
                    DispatchQueue.main.async{
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func loadSVG(_ url: URL, card: String){
        DispatchQueue.global().async {
            let bezierPaths = SVGBezierPath.pathsFromSVG(at: url)
            DispatchQueue.main.async {
                self.displaySVGImage(bezierPaths)
            }
        }
    }
    
    func displaySVGImage(_ bezierPaths: [SVGBezierPath]){
        let svgImage = SVGImageView()
        svgImage.paths = bezierPaths
        svgImage.translatesAutoresizingMaskIntoConstraints = false
        svgImage.contentMode = .scaleAspectFit
        self.addSubview(svgImage)
        NSLayoutConstraint.activate([
            svgImage.topAnchor.constraint(equalTo: self.topAnchor),
            svgImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            svgImage.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}

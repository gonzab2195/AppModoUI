//
//  UIImageExtension.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 23/01/2024.
//

import UIKit

extension UIImage {
    func resized(toWidth width: CGFloat) -> UIImage {
        let newSize = CGSize(width: width, height: width * size.height / size.width)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
    
}

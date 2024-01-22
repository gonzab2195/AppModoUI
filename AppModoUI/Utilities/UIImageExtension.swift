//
//  UIImageFromUrl.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 10/01/2024.
//

import UIKit

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
}

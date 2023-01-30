//
//  UIColor+random.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0,
                       green: CGFloat(arc4random_uniform(255)) / 255.0,
                       blue: CGFloat(arc4random_uniform(255)) / 255.0,
                       alpha: 1.0)
    }
}


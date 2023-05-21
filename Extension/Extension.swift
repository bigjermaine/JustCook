//
//  Extension.swift
//  JustCook
//
//  Created by Apple on 21/05/2023.
//

import Foundation
import UIKit



class GradientLabel: UILabel {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let gradientLayer = layer as? CAGradientLayer {
            gradientLayer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }
    }
}

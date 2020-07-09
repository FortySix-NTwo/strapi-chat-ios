//
//  ColorGradient.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

extension UIViewController {
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemIndigo.cgColor, UIColor.systemTeal.cgColor]
        gradient.locations = [0, 1]
        
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

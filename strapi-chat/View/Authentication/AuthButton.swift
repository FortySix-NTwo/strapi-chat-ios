//
//  AuthenticationButton.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

class AuthButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 5
        setTitle(title, for: .normal)
        setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        isEnabled = false
        setHeight(height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

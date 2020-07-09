//
//  AuthenticationFooterButton.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

class AuthFooterButton: UIButton {
    init(title: String, hyperLink: String){
        super.init(frame: .zero)
        
        let attributedTitle =
            NSMutableAttributedString(string: title, attributes: [
                .font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.white
        ])
        
        attributedTitle.append(NSAttributedString(string: hyperLink, attributes: [
            .font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.white
        ]))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

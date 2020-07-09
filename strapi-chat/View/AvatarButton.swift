//
//  AvatarButton.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

class AvatarButton: UIButton {
    init() {
        super.init(frame: .zero)
        setImage(#imageLiteral(resourceName: "add_photo"), for: .normal)
        imageView?.tintColor = .white
        imageView?.clipsToBounds = true
        imageView?.contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

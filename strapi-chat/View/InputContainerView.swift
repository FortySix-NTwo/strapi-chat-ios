//
//  InputContainerView.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 08/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

class InputContainerView: UIView {
    
    init(image: UIImage?, textField: UITextField, isSecure: Bool) {
        super.init(frame: .zero)
        setHeight(height: 50)
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .white
        imageView.alpha = 0.87
        
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 24, width: 28)
        
        let textView = UITextField()
        textView.textColor = .white
        if(isSecure == true){
            textField.isSecureTextEntry = true
        }
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingLeft: 46,
                         paddingBottom: -8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor,
                           bottom: bottomAnchor,
                           right: rightAnchor,
                           paddingLeft: 8,
                           height: 0.75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

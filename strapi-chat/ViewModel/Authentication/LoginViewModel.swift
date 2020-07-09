//
//  LoginViewModel.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation

struct LoginViewModel: ValidationProtocol {
    var email: String?
    var password: String?
    
    var isValid: Bool {
        return
            password?.isEmpty == false
            && email?.isEmpty == false
    }
}

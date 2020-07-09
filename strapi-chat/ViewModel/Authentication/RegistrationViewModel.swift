//
//  RegistrationViewModel.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation

struct RegistrationViewModel: ValidationProtocol {
    var user: String?
    var name: String?
    var email: String?
    var password: String?
    var confirm: String?
    
    var isValid: Bool {
        return
            user?.isEmpty == false
            && name?.isEmpty == false
            && email?.isEmpty == false
            && confirm?.isEmpty == false
            && password?.isEmpty == false
    }
}

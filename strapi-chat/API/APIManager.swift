//
//  APIManager.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation
import SwiftJWT

protocol APIManager {
    func register(register: RegisterModel, completionHandler: @escaping (Bool) -> ())
    func login(login: LoginModel, completionHandler: @escaping (Bool) -> ())
}

struct MyClaims: Claims {
   var jwt: String
}


//
//  LoginModel.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation

struct LoginModel: Encodable {
  var email: String
  var password: String
}

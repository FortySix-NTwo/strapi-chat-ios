//
//  RegistrationModel.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation

struct RegisterModel: Encodable {
  var fullname: String
  var username: String
  var email: String
  var password: String
}


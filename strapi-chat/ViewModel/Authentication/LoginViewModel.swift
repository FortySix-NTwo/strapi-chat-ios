//
//  LoginViewModel.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation

struct LoginViewModel: ValidationProtocol {
  var id: String?
  var email: String?
  var password: String?
  var token: Token?
  
  var isValidToken: Bool {
    return token?.userID.uuidString == id
  }
  
  var isValid: Bool {
    return
      password?.isEmpty == false
      && email?.isEmpty == false
  }
}

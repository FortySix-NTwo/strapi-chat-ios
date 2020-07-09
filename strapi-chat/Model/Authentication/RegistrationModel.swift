//
//  RegistrationModel.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation

struct RegistrationModel: Encodable {
  let name: String
  let username: String
  let email: String
  let password: String
}

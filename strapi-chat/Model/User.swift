//
//  User.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 11/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

final class User: Codable {
  var id: UUID?
  var user_image: String
  var email: String
  var username: String

  init(email: String, username: String, user_image: String) {
    self.email = email
    self.username = username
    self.user_image = user_image
  }
}

//
//  Token.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 11/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation

final class Token: Codable {
  var id: UUID?
  var token: String
  var userID: UUID

  init(token: String, userID: UUID) {
    self.token = token
    self.userID = userID
  }
}

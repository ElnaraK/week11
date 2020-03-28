//
//  Airport.swift
//  week11_SVPHUD
//
//  Created by Elnara  on 3/28/20.
//  Copyright © 2020 Elnara . All rights reserved.
//

import Foundation

class User: Codable {
    var id: String
    var first_name: String
    var last_name: String
    var gender: String
    var dob: String
    var email: String
    var phone: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
        case gender = "gender"
        case dob = "dob"
        case email = "email"
        case phone = "phone"
    }
}

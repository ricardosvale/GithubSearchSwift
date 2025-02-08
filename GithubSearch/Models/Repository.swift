//
//  Repository.swift
//  GithubSearch
//
//  Created by Ricardo on 07/02/25.
//

import Foundation

struct Repository: Decodable {
    var name: String
    var description: String?
    var language: String?
    var owner: User
}

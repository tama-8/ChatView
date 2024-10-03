//
//  Message.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/03.
//

import Foundation

struct Message: Decodable {
    let id: String
    let text: String
    let user: User
    let date: String
    let readed: Bool
}

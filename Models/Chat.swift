//
//  Chat.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/03.
//

import Foundation

struct Chat: Decodable {
    let id: String
    let messages: [Message]
}

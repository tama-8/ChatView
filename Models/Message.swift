//
//  Message.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/03.
//

import Foundation

struct Message: Decodable,Identifiable,Equatable{
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: String
    let text: String
    let user: User
    let date: String
    let readed: Bool
}

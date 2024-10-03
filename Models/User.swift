//
//  User.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/03.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let image: String
    
    var isCurrentUser: Bool{
        self.id == User.currentUser.id
    }
    
    static var currentUser: User{
        User(id: "1", name: "カーキ", image: "user01")
    }
}

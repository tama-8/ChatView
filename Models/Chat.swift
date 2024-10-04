//
//  Chat.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/03.
//

import Foundation

struct Chat: Decodable ,Identifiable{
    let id: String
    var messages: [Message]
    
    var recentMessageText: String{
        guard let recentMessage = self.messages.last else{ return ""}
        return recentMessage.text
    }
    var recentMessageDateString:String{
        guard let recentMessage = self.messages.last else{ return ""}
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: recentMessage.date) else { return "" }
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: date)
    }
}

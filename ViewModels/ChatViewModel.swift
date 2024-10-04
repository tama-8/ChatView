//
//  ChatViewModel.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/03.
//

import Foundation

class ChatViewModel: ObservableObject{
    
    @Published var chatData: [Chat] = []
//    @Published var messages: [Message] = []
    
    init() {
        chatData = fetchChatData()
//        messages = chatData[0].messages
    }
    
    private func fetchChatData() -> [Chat] {
        let fileName = "chatData.json"
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("\(fileName)が見つかりませんでした")
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のロードに失敗しました")
        }
        
        do {
            return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("\(fileName)を\(Chat.self)に変換することに失敗しました")
        }
    }
    
    func addMessage(chatId:String,text: String){
        
        guard let index = chatData.firstIndex (where: { chat in
            chat.id == chatId
        })else{ return }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDateString = formatter.string(from: Date())
        
        let newMessage = Message(
            id: UUID().uuidString,
            text: text,
            user: User.currentUser,
            date: formattedDateString,
            readed: false
        )
        chatData[index].messages.append(newMessage)
    }
}

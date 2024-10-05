//
//  ListView.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/04.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var vm: ChatViewModel = ChatViewModel()
    var body: some View {
        NavigationView {
            VStack{
                //ヘッダー
                header
                //リスト
                list
            }
            .padding(.horizontal)
        }
    }
}

struct ListView_Previews:PreviewProvider{
    static var previews: some View{
        ListView()
    }
}
    extension ListView {
        private var header: some View {
            HStack {
                Text("トーク")
                    .font(.title2.bold())
                
                Spacer()
                
                HStack (spacing: 16){
                    Image(systemName: "text.badge.checkmark")
                    Image(systemName: "square")
                    Image(systemName: "ellipsis.bubble")
                }
                .font(.title2)
            }
        }
        private var list: some View {
            ScrollView {
                VStack {
                    ForEach(vm.chatData) { chat in
                        NavigationLink{
                            ChatView(chat:chat)
                                .environmentObject(vm)
                                .toolbar(.hidden)
                        }label:{
                            listRow(chat: chat)
                        }
                    }
                }
            }
        }
        // private var listRow: some View {
        private func listRow(chat:Chat) -> some View{
       
            HStack {
                let images = vm.getImages(messages: chat.messages)
                HStack(spacing: -28){
                    ForEach(images, id:\.self){ image in
                        Image(image)
                            .resizable()
                            .frame(width: 48,height: 48)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .foregroundColor(Color(uiColor: .systemBackground))
                                    .frame( width: 54,height: 54)
                            )
                    }
                }
               
                VStack(alignment: .leading) {
                    Text(vm.getTitle(messages: chat.messages))
                        .lineLimit(1)
                        .foregroundColor(.primary)
                    Text(chat.recentMessageText)
                        .lineLimit(1)
                        .font(.footnote)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                Spacer()
                Text(chat.recentMessageDateString)
                    .font(.caption)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
    }

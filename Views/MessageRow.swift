//
//  MessageEow.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/02.
//

import SwiftUI

struct MessageRow: View {
    var body: some View {
        HStack(alignment: .top){
            userThumb
            massegeText
            messageState
            Spacer()
        }
        .padding(.bottom)
    }
}

struct MessageRow_Previews: PreviewProvider{
    static var previews: some View{
        MessageRow()
            .background(.cyan)
    }
}

extension MessageRow{
    private var userThumb: some View{
        Image("user01")
            .resizable()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
    }
    private var massegeText: some View{
        Text("こんにちは!")
            .padding()
            .background(.white)
            .cornerRadius(30)
    }
    private var messageState: some View{
        VStack(alignment: .trailing){
            Spacer()
            Text("既読")
            Text(formattedDataString)
        }
        .foregroundColor(.secondary)
        .font(.footnote)
    }
    private var formattedDataString: String{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
}

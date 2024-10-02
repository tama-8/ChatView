//
//  MessageEow.swift
//  ChatView
//
//  Created by kaori tamaki on 2024/10/02.
//

import SwiftUI

struct MessageRow: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 60,height: 60)
            Capsule()
                .frame(height: 60)
        }
        .padding(.bottom)
    }
}

struct MessageRow_Previews: PreviewProvider{
    static var previews: some View{
        MessageRow()
    }
}

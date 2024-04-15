//
//  ModalView.swift
//  D-Day App
//
//  Created by lovehyun95 on 4/15/24.
//

import SwiftUI

import SwiftUI

class Memo {
    var id: UUID = UUID()
    var title: String
    var endDate: Date
    
    init(title: String, endDate: Date) {
        self.title = title
        self.endDate = endDate
    }
}

struct ContentView: View {
    @State var showSheet = false
    @State var memoList: [Memo] = [
        Memo(title: "여름휴가", endDate: Date.now)
    ]
    var body: some View {
        NavigationStack {
            List(memoList, id: \.id) { memo in
                HStack {
                    Text(memo.title)
                    Text(memo.endDate.description)
                    Spacer()
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            })
            .sheet(isPresented: $showSheet, content: {
                VStack {
                    Text("Sheet")
                    Button {
                        showSheet = false
                    } label: {
                        Text("닫기")
                    }
                }
            })
        }
    }
}


#Preview {
    ModalView()
}

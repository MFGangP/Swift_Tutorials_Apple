//
//  UseBinding.swift
//  SwiftDataTest
//
//  Created by lovehyun95 on 4/16/24.
//

import SwiftUI

struct UseBinding: View {
    // 뷰의 상태를 책임지는 @State
    @State var name: String = ""
    // State 변수 끼리 묶으려면 @Binding
    var body: some View {
        VStack{
            TextField("Placeholder", text: $name)
            Text(name)
            // State 변수에 달러를 붙이면 바인딩이 된다.
        }
    }
}

#Preview {
    UseBinding()
}

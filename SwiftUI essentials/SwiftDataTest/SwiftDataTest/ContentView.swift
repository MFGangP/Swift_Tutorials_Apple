//
//  ContentView.swift
//  SwiftDataTest
//
//  Created by lovehyun95 on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "world"
    
    var body: some View {
        // 배워서 어디다 쓸까?
        // State and Binding
        // 컴포넌트에 Binding 써야한다는 에러 고칠 때
        // 다른 화면에서 데이터를 같이 쓸 때
        // 화면이 업데이트 되었으면 할 때
        // 데이터의 흐름을 만들 때 State -> Binding
        
        // State란
        // Struct로 인스턴스를 만들면 고칠 수가 없다
        // Class로 인스턴스를 만들면 수정된다.
        // SwiftUI는 한번 그릴 때마다 다시 그려줘야된다.
        // State가 바뀌면 화면이 다시 그려지게 끔 해주는 원리
        
        // 배워서 어디다 쓸까?
        // 반복되는 데이터의 형태 만들기
        // 내가 가지고 있는 데이터에 이름 붙이기
        // 내가 가지고 있는 데이터 정리하기
        
        // Data persistence
        // 배워서 어디다 쓸까?
        // Coredata, Swiftdata, file I/O의 차이를 이해하기 UserDefault 등등
        // 데이터를 저장하는데 필요한 기본지식 알기
        // 데이터를 저장하고 불러오는 방법 알기
        
        // Create, Read, Update, Delete
        // 
        VStack{
            Text("Hello, \(name)!")
            Button(action: {
                name = "Leeo"
            }, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    ContentView()
}

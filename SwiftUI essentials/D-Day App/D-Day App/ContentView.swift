//
//  ContentView.swift
//  D-Day App
//
//  Created by lovehyun95 on 4/15/24.
//

import SwiftUI
// 구조이자 새로운 타입
// 인스턴스 = 구조체를 통해서(사용해서) 만들어진 데이터
// 구조체 안에 있는 함수는 매서드
// 클래스는 참조 타입(깊은 복사) 스트럭트는 값 타입(얕은 복사)
// 클래스는 값을 할당 하면 주소값을 가지게 된다.
// .name에 .은 접근자

struct Memo {
    // UUID: 네트웤 상에서 고유성이 보장되는 id를 만들기 위한 표준 규약
    var id: UUID = UUID()
    // 구조체 속성 = 프로퍼티
    // Stored Property 저장된 프로퍼티 - 저장된 상수 또는 변수
    var title: String
    var endDate: Date
}


struct ContentView: View {
    // Array(배열)
    // [] 대괄호 안에는 타입을 정해주는 부분
    @State var memoList: [Memo] = [

        Memo(title: "여름휴가", endDate: Date.now)
    ]
    var body: some View {
        List(memoList, id: \.id) { memo in
            HStack {
                Text(memo.title)
                Text(memo.endDate.description)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

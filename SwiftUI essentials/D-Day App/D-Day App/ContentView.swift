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
    
    init(title: String, endDate: Date) {
        self.title = title
        self.endDate = endDate
    }
}
struct ContentView: View {
    @State var currentDate = Date() // 생성한 시간과 날짜
    @State var newText = ""
    @State var showSheet : Bool = false
    // Array(배열)
    // [] 대괄호 안에는 타입을 정해주는 부분 여기서는 Memo 타입만 들어갈 수 있다.
    @State var memoList: [Memo] = [
        Memo(title: "여름휴가", endDate: Date.now)
    ]
    // 뷰 안에서 하나하나의 컴포넌트도 뷰라고 부르고
    // 각각 고유한 ID값을 가지게 된다. 화면을 재구성 할 때 ID값을 통해 재구성 한다 구조적 ID값
    // 기존에 있는 값들은 스위프트가 알아서 ID값을 할당하는데 우리가 만든 리스트 값은 스위프트가 값을 모른다. 그래서 id 값을 통해 전달해 줌으로써 스위프트에게 알려주는 역할
    // 명시적 id 값이라고 부름
    var body: some View {
        NavigationStack {
            // List는 memo라는 애한테 데이터를 넣어주고 넣어준 데이터를 표시
            List(memoList, id: \.id) { memo in
                HStack {
                    Text(memo.title)
                    Text(memo.endDate.description)
                    Spacer()
                }
            }
            // 툴바를 만들기위해 사용함
            .toolbar(content: {
                // 툴바 위치를 조정하는 함수
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            })
            // Bool 타입의 값을 넘겨받기 때문에 showSheet 값을 넘겨주면 된다.
            // $ 사인은 바인딩을 위해서 써줌
            .sheet(isPresented: $showSheet,
                   content: {
                // 이 안에 치는 내용이 모달이 보여주는 내용
                // Binding<String> 의 뜻는 바인딩 된 스트링 값을 넘겨줘 라는 뜻.
                // DatePicker("종료일", selection
                VStack {
                    TextField(text: $newText, label: { Text("추가하고 싶은 날(ex. 부모님 생신)") })
                    DatePicker(
                        "종료일",
                        selection: $currentDate,
                        //
                        displayedComponents: [.date]
                    )
                    // 보여주는 방식을 선택하는 방법
                    .datePickerStyle(.wheel)
                    Button {
                        // 눌렸을 때 리스트에 추가해주기 위해
                        // Memo 타입의 값을 넣어줘야 하는데
                        // 내가 만든 newText 값이랑 currentDate 값을 넣어줄거다.
                        memoList.append(Memo(title: newText, endDate: currentDate))
                        // 추가를 하면 화면을 꺼야하니까 false
                        showSheet = false
                    } label: {
                        Text("추가")
                    }

                }
                .padding(20)
            })
        }
    }
}
#Preview {
    ContentView()
}

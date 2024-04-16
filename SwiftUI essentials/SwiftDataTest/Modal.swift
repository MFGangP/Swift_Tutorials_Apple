//
//  Modal.swift
//  SwiftDataTest
//
//  Created by lovehyun95 on 4/16/24.
//

import SwiftUI

struct Modal: View {
    // 여기에 있는 showModal을 다른 곳에서도 써야 할 때
    @State var showModal: Bool = false
    
    var body: some View {
        Button("show"){
            showModal.toggle()
        }
        // 갈고리를 거는 역할이 바인딩
        // 이 모달 창을 가리거나 보여주는 역할을 하는 변수에 걸어야한다.
        .sheet(isPresented: $showModal, content: {
            // 하위 뷰에서 상위 뷰에 바인딩을 건다면 다음 과 같이 되어야함
            // 여기는 맞는지 아닌지만 체크 하기 때문에 체크 잘 해야 됌
            ModalChild(showModal: $showModal)
        })
    }
}

struct ModalChild: View {
    // 첫번째 방법 - 이상하진 않은데 원하는 대로 동작 안함
    // @State var showModal: Bool
    // 상위 뷰에 간섭하겠다는 의미
    // 다른 화면에 있는 값에 내 자신을 묶고싶다.
    @Binding var showModal : Bool
    
    var body: some View {
        VStack{
            Text("child")
            Button("close"){
                showModal = false
            }
        }
    }
}
#Preview {
    Modal()
}

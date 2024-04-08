//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by lovehyun95 on 4/8/24.
//

import SwiftUI

struct FavoriteButton: View {
    // 바인딩 속성 래퍼를 사용하면 데이터를 저장하는 속성과 데이터를 표시하고 변경하는 보기 간에 읽고 쓸 수 있다.
    // 바인딩을 사용하기 때문에 이 뷰 내에서 변경된 내용이 데이터 소스에 다시 전달된다.
    @Binding var isSet: Bool
    
    var body: some View {
        // isSet 상태를 전환하고 상태에 따라 모양을 변경하는 버튼을 사용
        Button {
            isSet.toggle()
        } label: {
            // iconOnly 라벨 스타일을 사용하면 제목 문자열은 UI에 표시되지 않지만 VoiceOver를 사용하면 접근성을 향상 시켜준다.
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}

//
//  ImageLoaderView.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString : String = Contants.randomImage // Contants의 randomImage String값.
    var resizeingMode : ContentMode = .fill // 경계가 바뀔 때 뷰가 내용을 어떻게 배치하는지 결정하는 데 사용되는 플래그. ContentMode 라는 데이터 형식을 처음 봄.
    
    var body: some View {
        Rectangle()
            .opacity(0.001) // 불투명도
            .overlay(
                // SDWebImage 안에 들어있는 함수 WebImage
                WebImage(url: URL(string: urlString))
                    .resizable() // 사이즈 조절
                    .indicator(.activity) // 이 부분 모르겠음 .indicator는 주로 프로그레스 인디케이터(활동 표시기) 또는 특정 상태를 사용자에게 시각적으로 알리기 위해 사용. 기본 컴포넌트가 아님.
                    .aspectRatio(contentMode: resizeingMode) // 이미지의 비율을 유지 시켜주는데 이미지 전체를 보여주거나, 이미지가 잘리더라도 꽉 채우거나.
                    .allowsHitTesting(false) // 이거도 뭔지 모르겠음. 히트 테스트에 참여할 지 여부(?)
                // 중첩이 있는 경우 사진을 보고있는 그 부분에만 반응이 이루어졌으면 좋겠기 때문에 사용하는 것. !!!!!!! 오버레이에 클립이 적용되었기 때문에 해주어야한다.
            ) // Zstack 없이 그 위에 얹는게 가능하다는데 왜 따로 이런 기능이 있는 것인지 모르겠음. 뷰 원본의 공간을 기준으로 그 위에 새로운 뷰를 중첩하여 쌓는 기능을 하는 수식어
            .clipped() // 이 뷰를 경계 직사각형 프레임으로 클립
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30) // 곡률 30 이대로 사용해도 좌우 여백이 잘렸는데 clipped를 왜 또 썻지?
        .padding(40) // 가로 세로 여백 40
        .padding(.vertical, 60) // 가로 여백 60
}

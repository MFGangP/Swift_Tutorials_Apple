//
//  LandmarkList.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/29/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            // landmarks 구성요소를 리스트 형식으로 반환
            // 내부 landmark 변수로 돌면서 값을 받아옴
            // 이 부분 이해가 안되니까 물어봐야함
            List(landmarks, id: \.id) { landmark in
                // 내가 눌렀을 때 원하는 View 가 나오는 역할
                NavigationLink{
                    // 아래에 있는 뷰로 클릭을 했을 때 이동시켜 줌
                    LandmarkDetail()
                }label: {
                    // LandmarkRow 반복
                    LandmarkRow(landmark: landmark)
                }
            // 네비게이션 타이틀
            // 부드럽게 화면이 넘어간다. 왼쪽 위에 뒤로가기를 만들어줌
            }.navigationTitle("Landmarks")
        } detail:{
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

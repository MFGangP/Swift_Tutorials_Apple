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
                // LandmarkRow
                LandmarkRow(landmark: landmark)
                // 네비게이션 타이틀
            }.navigationTitle("Landmarks")
        } detail:{
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

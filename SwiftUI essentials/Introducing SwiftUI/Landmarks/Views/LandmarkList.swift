//
//  LandmarkList.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/29/24.
//

import SwiftUI

struct LandmarkList: View {
    
    // ContentView 미리보기를 업데이트하여 모델 개체를 환경에 추가하면 개체를 모든 하위 보기에서 사용할 수 있습니다. User_Sec5
    @Environment(ModelData.self) var modelData
    // 상태 속성을 사용하여 뷰 및 해당 하위 뷰와 관련된 정보를 보유하기 때문에 항상 상태를 private로 해줘야한다.
    // 목록이 변하는걸 보고싶으면 초기값을 변경해주면 됌 User_Sec2
    // 실행하기 전에 ShowFavoritesOnly값을 false로 돌린다. User_Sec3
    @State private var showFavoritesOnly = false
    
    // 속성과 각 값을 확인하여 리스트의 필터링된 버전을 계산
    var filteredLandmarks: [Landmark] {
        // landmarks를 필터링 할 때 modelData.landmarks 사용
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            // landmarks 구성요소를 리스트 형식으로 반환
            // 내부 landmark 변수로 돌면서 값을 받아옴
            // 이 부분 이해가 안되니까 물어봐야함
            // List(landmarks, id: \.id) { landmark in
            // 필터링된 버전 에서 랜드마크 목록을 사용함.
            // List(filteredLandmarks) { landmark in User_Sec2
            
            // 행으로 변환하기 위해 ForEach로 그룹을 만듦
            List{
                // 토글 뷰의 첫번째 하위 항목으로 리스트 뷰를 추가하고 showFavoritesOnly 바인딩을 전달
                // 상태 변수 또는 속성에 접근 하려면 $ 접두사 사용
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                // 두 개 이상의 서로 다른 동적 View 그룹을 결합하려면 리스트 데이터 collection 대신 ForEach를 사용할 것
                ForEach(filteredLandmarks){ landmark in
                    // 내가 눌렀을 때 원하는 View 가 나오는 역할
                    NavigationLink{
                        // 아래에 있는 뷰로 클릭을 했을 때 이동시켜 줌
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        // LandmarkRow 반복
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // filteredLandmarks 값이 변경될 때 animation(_:) 수정자를 추가하여 필터링 애니메이션을 개선
            .animation(.default, value: filteredLandmarks)
            // 네비게이션 타이틀
            // 부드럽게 화면이 넘어간다. 왼쪽 위에 뒤로가기를 만들어줌
            .navigationTitle("Landmarks")
        } detail:{
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        // 환경에 모델 개체가 필요하지만 미리 보는 보기에 환경(_:) 수식자가 없는 경우 미리 보기가 실패합니다. User_Sec5
        .environment(ModelData())
}

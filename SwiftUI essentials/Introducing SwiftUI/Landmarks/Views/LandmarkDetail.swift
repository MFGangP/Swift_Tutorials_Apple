//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/29/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        // 모델 데이터와 비교하여 랜드마크의 입력 인덱스를 계산
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        // Bindable 래퍼를 사용하여 모델 데이터 추가
        @Bindable var modelData = modelData
        
        // 사용자가 스크롤 할 수 있도록 변경
        ScrollView {
        // VStack {
            // 지도
            // MapView()
            // 사용자 정의 유형 - 필요한 데이터 전달
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            // 프로필 사진
            // CircleImage()
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            // 타이틀 자리
            VStack(alignment: .leading) {
                // 랜드마크 이름을 포함하고 $기호로 isFavorite 속성에 바인딩을 제공
                HStack{
                    // Text("Turtle Rock")
                    Text(landmark.name)
                        .font(.title)
                    // landmarkIndex를 사용하여 버튼이 모델 객체에 저장된 랜드마크의 isFavorite 속성을 업데이트 하는지 확인
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                // 상세 설명
                HStack {
                    // Text("Joshua Tree National Park")
                    Text(landmark.park)
                    Spacer()
                    // Text("California")
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                
                Divider()
                
                
                // Text("About Turtle Rock")
                Text("About \(landmark.name)")
                    .font(.title2)
                // Text("Descriptive text goes here.")
                Text(landmark.description)
            }
            .padding()
            
            
            Spacer()
        }
        // 세부정보 보기를 표시할 때 탐색모음에 제목을 지정하는 수정자
        .navigationTitle(landmark.name)
        // 제목이 인라인으로 표시되도록 수정
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
//        // ModelData 오브젝트의 환경 개채를 사용하도록 뷰를 수정
//    LandmarkDetail(landmark: ModelData().landmarks[0])
}

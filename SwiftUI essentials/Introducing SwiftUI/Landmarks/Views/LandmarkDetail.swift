//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/29/24.
//

import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
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
                // Text("Turtle Rock")
                Text(landmark.name)
                    .font(.title)
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
    // ModelData 오브젝트의 환경 개채를 사용하도록 뷰를 수정
    LandmarkDetail(landmark: ModelData().landmarks[0])
}

//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/29/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    // 랜드마크 행의 역할은 이미지와 이미지 이름을 가로로 표시해주는 것
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            // 랜드마크 좋아요가 참이라면 노란색 별 표시
            if landmark.isFavorite{
                Image(systemName:  "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview("Turtle Rock") {
    // LandmarkRow Preview를 작동시키기 위해 ModelData 오브젝트 업데이트
    let landmarks = ModelData().landmarks
    return Group{
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

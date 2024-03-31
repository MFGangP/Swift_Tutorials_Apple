//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/29/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            // 지도
            MapView()
                .frame(height: 300)
            // 프로필 사진
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            // 타이틀 자리
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                // 상세 설명
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                
                Divider()
                
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            
            Spacer()
        }
    }
}

#Preview {
    LandmarkDetail()
}

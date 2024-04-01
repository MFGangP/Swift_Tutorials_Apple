//
//  ContentView.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
//        VStack {
//            MapView()
//                .frame(height: 300)
//            CircleImage()
//                .offset(y: -130)
//                .padding(.bottom, -130)
//            
//            VStack(alignment: .leading){
//                Text("Turtle Rock")
//                    .font(.title)
//                    .foregroundStyle(.black)
//                
//                HStack {
//                    Text("Joshua Tree National Park")
//                        .font(.subheadline)
//                    Spacer()
//                    Text("California")
//                        .font(.subheadline)
//                }
//            // 폰트
//            .font(.subheadline)
//            // 배경색
//            .foregroundColor(.secondary)
//            
//            Divider()
//            
//            Text("About Turtle Rock")
//                .font(.title)
//            Text("Descriptive text goes here.")
//        }
//        .padding()
//        
//        Spacer()
//        }
    }
}

#Preview {
    // ContentView 미리보기를 업데이트하여 모델 개체를 환경에 추가하면 개체를 모든 하위 보기에서 사용할 수 있습니다.
    ContentView()
    // 환경에 모델 개체가 필요하지만 미리 보는 보기에 환경(_:) 수식자가 없는 경우 미리 보기가 실패합니다.
        .environment(ModelData())
}


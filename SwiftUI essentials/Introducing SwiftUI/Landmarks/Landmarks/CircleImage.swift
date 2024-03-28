//
//  CircleImage.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        // 이미지 추가
        Image("turtlerock")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}

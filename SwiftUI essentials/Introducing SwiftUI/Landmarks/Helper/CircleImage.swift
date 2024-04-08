//
//  CircleImage.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import SwiftUI

struct CircleImage: View {
    // 뷰를 빌드할 때 일반적인 패턴
    // 사용자 정의 뷰는 특정 뷰에 대한 수정자를 래핑하고 캡슐화함
    var image: Image
    
    var body: some View {
        
        // 이미지 추가
        //Image("turtlerock")
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    // CircleImage()
    // 원 이미지 인스턴스화하는 뷰에도 입력 매개변수가 필요함
    // CircleImage(image: Image("turtlerock"))
    CircleImage(image: Image("turtlerock"))
}

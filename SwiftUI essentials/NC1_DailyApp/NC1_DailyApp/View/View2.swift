//
//  View2.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/15/24.
//

import Foundation
import SwiftUI


struct View2: View {
    @Binding var medicines : Medicine
    var body: some View {
        VStack{
            // 탭이랑 띄우기 위해서 사용한 스페이서
            Spacer()
                .frame(minHeight: 40, maxHeight: 40)
            Text("몇 월 몇 일 ")
                .font(Font.custom("SF Pro", size: 32))
                .lineSpacing(15)
                .foregroundColor(.black);
            // 날짜와 구분해주기 위한 Divider
            Divider()
                .background(Color.black)
            Spacer()
                .frame(minWidth: 20, maxWidth: 20, minHeight: 20, maxHeight: 20)
            ScrollView(.horizontal, showsIndicators: false){
                VStack{
                    Text("화요일")
                            .font(Font.custom("SF Pro", size: 12))
                        Circle()
                            .frame(minWidth: 37, maxWidth: 37, minHeight: 37 , maxHeight: 37)
                            .foregroundColor(.cyan)
                }
            }
            // 화면 하단 여백을 띄우기 위한 Spacer()
            Spacer()
        }
    }
}
#Preview {
    View2(medicines: Binding<Medicine>)
}

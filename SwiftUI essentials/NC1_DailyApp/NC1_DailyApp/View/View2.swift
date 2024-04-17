//
//  View2.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/15/24.
//

import Foundation
import SwiftUI


struct View2: View {
    @Binding var medicines : [Medicine]
    let CircleSizeInt : CGFloat = 42
    var body: some View {
        // Date 타입을 바로 받는게 아니였다.
        let monthDayFormat = Date.FormatStyle()
            .day()
            .month()
            .locale(Locale(identifier: "ko_KR"))
        // 요일을 따로 추출하고 싶어서 선언한 상수
        let weekFormat = Date.FormatStyle()
            .weekday()
            .locale(Locale(identifier: "ko_KR"))
        // formatted()는 FormatStyle, F.FormatInput을 받는다 타입을 맞춰줘야 된다.
        let mondthDayString = medicines[0].date.formatted(monthDayFormat)
        let weekString = medicines[0].date.formatted(weekFormat)
        VStack{
            // 탭이랑 띄우기 위해서 사용한 스페이서
            Spacer()
                .frame(minHeight: 40, maxHeight: 40)
            Text("\(mondthDayString)(오늘)")
                .font(Font.custom("SF Pro", size: 32))
                .lineSpacing(15)
                .foregroundColor(.black);
            // 날짜와 구분해주기 위한 Divider
            Divider()
                .background(Color.black)
            Spacer()
                .frame(minWidth: 20, maxWidth: 20, minHeight: 20, maxHeight: 20)
            ScrollView(.horizontal, showsIndicators: false){
                // 가로로 출력 되어야 하기 때문에
                HStack{
                    ForEach(medicines, id: \.id) { medicines in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                                   label: {
                                VStack{
                                    Text("\(weekString)요일")
                                        .font(Font.custom("SF Pro", size: 12))
                                    Circle()
                                        .frame(minWidth: CircleSizeInt, maxWidth: CircleSizeInt, minHeight: CircleSizeInt , maxHeight: CircleSizeInt)
                                        .foregroundColor(.cyan)
                                }// Vstack 끝
                            }) // Button 끝
                    }// Foreach 끝
                    // 투약 관리 기록 부분
                    
                }//HStack 끝
            }// 스크롤 뷰 끝
            // 화면 하단 여백을 띄우기 위한 Spacer()
            Spacer()
        }// Vstack 끝
    }
}

#Preview {
    MedicineDaily()
}

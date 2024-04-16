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
    var body: some View {
        // Date 타입을 받는게 아니였다.
        let monthDayFormat = Date.FormatStyle()
            .day()
            .month()
            .locale(Locale(identifier: "ko_KR"))
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
            Text("\(mondthDayString)")
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
                    Text("\(weekString)요일")
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
    MedicineDaily()
}

//
//  View1.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/15/24.
//

import Foundation
import SwiftUI

struct CalenderView : UIViewRepresentable {
    // 과거와의 간격 차이를 알기 위해 선언함.
    let interval: DateInterval
    // @Observable
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        // 캘린더 속성을 그래고리안으로 설정.
        view.calendar = Calendar(identifier: .gregorian)
        // 
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
}

struct View1: View {
    // 데이터 바인딩
    @Binding var medicines : [Medicine]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack{
                Spacer()
                VStack{
                    // 위쪽 탭이랑 여백 주기 위해
                    Spacer()
                        .frame(minWidth: 32, maxHeight: 32)
                    // 캘린더 뷰를 호출 하는데 날짜 사이에 간격이 필요하고 시작 날짜는 먼 과거 끝 날짜는 한 달 뒤
                    HStack{
                        // 달력 좌측 여백
                        Spacer()
                        CalenderView(interval: DateInterval(start: .distantPast, end: .distantFuture))
                        // 달력 우측 여백
                        Spacer()
                    }
                    Spacer()
                        .frame(minHeight: 10, maxHeight: 10)
                    // 버튼 부분 시작
                    VStack{
                        Button {
                            
                        } label: {
                            // 배경을 뒤에 깔고 위쪽에 내용을 배치하기 위해 사용
                            ZStack{
                                // 배경 들어가는 부분
                                Rectangle()
                                    // 색을 연하게 쓰기 위해서 opacity 추가했음.
                                    .foregroundColor(Color.gray.opacity(0.2))
                                    // 크기 고정
                                    .frame(minWidth: 371, maxWidth: 371, minHeight: 100, maxHeight: .infinity)
                                    .cornerRadius(10)
                                // 선 + 텍스트 들어가는 Stack 부분
                                HStack(spacing: 10){
                                    // 좌측 표시선
                                    Rectangle()
                                        .foregroundColor(.red)
                                        .frame(minWidth: 7, maxWidth: 7, minHeight: 80, maxHeight: 80)
                                        .cornerRadius(13)
                                    // 통증 부위 + 복용 사실 + 통증 기간
                                    VStack(alignment: .leading){
                                        // 배열 -> 배열 -> 요소 -> value 값
                                        Text("\(medicines[0].painDetail[0].painPart.rawValue) \(medicines[0].painDetail[0].painPartNumber.rawValue) 통증")
                                            .font(Font.custom("SF Pro", size: 24))
                                            .lineSpacing(15)
                                            .foregroundColor(.black);
                                        Text("\(medicines[0].medicineDetail[0].medicineName) 복용")
                                            .font(Font.custom("SF Pro", size: 16))
                                            .lineSpacing(15)
                                            .foregroundColor(Color.black.opacity(0.6));
                                        Text("2024.04.01"+"~"+"2024.04.05")
                                            .font(Font.custom("SF Pro", size: 16))
                                            .lineSpacing(15)
                                            .foregroundColor(Color.black.opacity(0.6));
                                    }// Vstack 끝
                                    // 글자와 글자 사이를 띄워주기 위해 사용하는 Spacer()
                                    Spacer()
                                        .frame(maxWidth: 90)
                                    // 방향 기호(chevron)를 넣기위해 사용
                                    VStack{
                                        Text("􀆊")
                                            .font(Font.custom("SF Pro", size: 20))
                                            .lineSpacing(15)
                                            .foregroundColor(.black);
                                        Spacer()
                                            .frame(minHeight: 45, maxHeight: 45)
                                    }
                                }// Hstack 끝
                            }// Zstack 끝
                        }// Label 끝
                    } // Vstack 
                      // 버튼 부분 끝
                } // Vstack 끝
                Spacer()
            } // HStack{
        } // ScrollView
    } // var body: some View {
} // struct View1: View {
#Preview {
    MedicineDaily()
}

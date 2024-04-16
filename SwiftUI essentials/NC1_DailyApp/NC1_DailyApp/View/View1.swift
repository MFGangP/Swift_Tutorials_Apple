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
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack{
                Spacer()
                VStack{
                    // 위쪽 탭이랑 여백 주기 위해
                    Spacer(minLength: 27)
                    // 캘린더 뷰를 호출 하는데 날짜 사이에 간격이 필요하고 시작 날짜는 먼 과거 끝 날짜는 먼 미래
                    HStack{
                        // 달력 좌측 여백
                        Spacer()
                        CalenderView(interval: DateInterval(start: .distantPast, end: .distantFuture))
                        // 달력 우측 여백
                        Spacer()
                    }
                    Spacer()
                    VStack{
                        Button {
                            
                        } label: {
                            // 배경을 뒤에 깔고 위쪽에 내용을 배치하기 위해 사용
                            ZStack{
                                // 배경 들어가는 부분
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 371, maxWidth: 371, minHeight: 100, maxHeight: .infinity)
                                    .cornerRadius(13)
                                // 선 + 텍스트 들어가는 Stack 부분
                                HStack(spacing: 10){
                                    // 좌측 표시선
                                    Rectangle()
                                        .foregroundColor(.red)
                                        .frame(minWidth: 7, maxWidth: 7, minHeight: 80, maxHeight: 80)
                                        .cornerRadius(13)
                                    // 통증 부위 + 복용 사실 + 통증 기간
                                    VStack(alignment: .leading){
                                        Text("왼쪽 손목 두번째 마디")
                                        Text("소염 진통제 복용")
                                        Text("2024.04.01"+"~"+"2024.04.05")
                                    }// Vstack 끝
                                }// Hstack 끝
                            }// Zstack 끝
                        }// Label 끝
                                


                    } // Vstack 끝
                }
                Spacer()
            }
        }
    }
}
#Preview {
    MedicineDaily()
}

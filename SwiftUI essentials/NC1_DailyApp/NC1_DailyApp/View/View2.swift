import Foundation
import SwiftUI

struct View2: View {
    
    @Binding var medicines : [Medicine]
    @State private var selectedDate = Date()
    private let calendar = Calendar.current
    
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
        
        VStack{
            // 탭이랑 띄우기 위해서 사용한 스페이서
            Spacer()
                .frame(minHeight: 40, maxHeight: 40)
            Text("(오늘)")
                .font(Font.custom("SF Pro", size: 32))
                .lineSpacing(15)
                .foregroundColor(.black);
            // 날짜와 구분해주기 위한 Divider
            Divider()
                .background(Color.black)
            Spacer()
                .frame(minWidth: 20, maxWidth: 20, minHeight: 20, maxHeight: 20)
            NavigationStack{
                ScrollView(.horizontal, showsIndicators: false){
                    // 가로로 출력 되어야 하기 때문에
                    HStack(spacing: 7, content: {
                        ForEach(medicines.indices, id: \.self) { indices in
                            Button(action: {
                                
                            },
                                   label: {
                                VStack{
                                    Text("\(medicines[indices].medicineDetail[0].medicineTakingDate.formatted(weekFormat))요일")
                                        .font(Font.custom("SF Pro", size: 12))
                                    Circle()
                                        .frame(minWidth: CircleSizeInt, maxWidth: CircleSizeInt, minHeight: CircleSizeInt , maxHeight: CircleSizeInt)
                                        .foregroundColor(.cyan)
                                }// Vstack 끝
                            }) // Button 끝
                        }// Foreach 끝
                    })// 투약 관리 기록 부분
                }//HStack 끝
            }// 스크롤 뷰 끝
            // 화면 하단 여백을 띄우기 위한 Spacer()
            Spacer()
        }// Vstack 끝
        /// 월 표시
    }
    func monthTitle(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
        return dateFormatter.string(from: date)
    }
    
    /// 월 변경
    func changeMonth(_ value: Int) {
        guard let date = calendar.date(
            byAdding: .month,
            value: value,
            to: selectedDate
        ) else {
            return
        }
        
        selectedDate = date
    }
    
    /// 요일 추출
    func day(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("E")
        return dateFormatter.string(from: date)
    }
}



#Preview {
    MedicineDaily()
}

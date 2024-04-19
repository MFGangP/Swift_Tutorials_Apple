import Foundation
import SwiftUI

struct View2: View {
    
    //    @Binding var dateArray : [Date]
    //    @Binding var dateIntArray : [Int]
    @Binding var medicines : [Medicine]
    @Binding var DateSetArray : DateSetArray
    //    @Binding var ArrayDateAndInt : [(Date, Int)]
    @State private var todayDate = Date()
    private let calendar = Calendar.current
    let CircleSizeInt : CGFloat = 42 // 원 크기
    // 제일 처음 보여주는 개체
    @Binding var indexBasic: Int
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            Spacer()
            // 위쪽 여백
                .frame(height: 60)
            // 제일 처음 보여주는 개체 - 바인딩 된 Int형, 전체 요소 items = 바인딩 된 배열 형태
            SwiftUIWheelPicker($indexBasic, items: DateSetArray.dayOfWeek) { value in
//                Button {
//
//                } label: {
                // 버튼을 추가하면 옆으로 넘어가는 기능이 작동을 하지 않음
                    VStack{
                        Text("\(value)")
                            .frame(width: 45, height: 14, alignment: .center)
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 45 , height: 45)
                    }
                    
//                }
                
            }
            
            
            .frame(width: 371, height: 30, alignment: .center)
            .padding(.top, 10)
        }.onAppear(){
            let DayFormatter = DateFormatter()
            DayFormatter.dateFormat = "yyyy-MM-dd"
            //            let _ = print(DateSetArray.dateArray)
            //            let _ = print(todayDate)
            if let foundIndex = DateSetArray.dateArray.firstIndex(where: { $0 == DayFormatter.string(from: Date()) }) {
                indexBasic = foundIndex
            }
            
            // let _ = print(Date())
            // let _ = print(indexBasic)
            // let _ = print(DateSetArray.dateArray.count)
        }
        Spacer()
    }
}

#Preview {
    MedicineDaily(DateSetArray: DateSetArray(dateArray: [], dayOfWeek: [], monthAndDay: []), indexBasic: 1157)
}

import Foundation
import SwiftUI

struct View2<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
    var data: Item
    @ViewBuilder var content: (Item.Element) -> Content
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let itemWidth: CGFloat = 95
            
            VStack {
                ScrollView(.horizontal) {
                    HStack(alignment: .center) {
                        ForEach(data) { item in
                            content(item)
                                .frame(width: itemWidth)
                        }
                    }
                    .padding(.horizontal, (size.width - itemWidth) / 2)
                }
                .border(.blue, width: 2)
                .scrollIndicators(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
#Preview {
    MedicineDaily(DateSetArray: DateSetArray(dateArray: [""]), indexBasic: 1157)
}
//@Binding var medicines : [Medicine]
//@Binding var DateSetArray : DateSetArray
//@State private var todayDate = Date()
//private let calendar = Calendar.current
//let CircleSizeInt : CGFloat = 42 // 원 크기
//@Binding var indexBasic: Int // 제일 처음 보여주는 개체

// VStack(){
//            Spacer()
//            // 위쪽 여백
//                .frame(height: 60)
//            // 스크롤 뷰가 최상단으로 나와야 여러개의 스크롤 뷰가 생기지않고 하나의 뷰만 생성 된다.
////            GeometryReader(content: { geometry in
////                let size = geometry.size
//
//                ScrollView(.horizontal, showsIndicators: false){
//                    // 가로로 버튼을 펼치고 동적할당으로 메모리를 절약하려면 LazyStack을 쓰는 것이 좋다고 한다.
//                    LazyHStack{
//                        // 반복문 돌면서 3년전 ~ 2달 뒤 날짜까지 불러오기 위해
//                        ForEach(DateSetArray.dateArray.indices, id: \.self) { index in
//                            Button(action: {
//
//                            }) {
//                                VStack {
//                                    Text(DateSetArray.dateArray[index + 1])
//                                        .frame(width: 45, height: 14, alignment: .center)
//                                    Circle()
//                                        .fill(Color.gray)
//                                        .frame(width: 45 , height: 45)
//                                }
//                            }
//                        }
//                    }
//                }
//            .frame(width: 371, height: 70, alignment: .center)
//            .padding(.top, 10)
//        }.onAppear(){
//            let DayFormatter = DateFormatter()
//            DayFormatter.dateFormat = "yyyy-MM-dd"
//            //            let _ = print(DateSetArray.dateArray)
//            //            let _ = print(todayDate)
//            if let foundIndex = DateSetArray.dateArray.firstIndex(where: { $0 == DayFormatter.string(from: Date()) }) {
//                indexBasic = foundIndex
//            }
//
//            // let _ = print(Date())
//            // let _ = print(indexBasic)
//            // let _ = print(DateSetArray.dateArray.count)
//        }
//        Spacer()

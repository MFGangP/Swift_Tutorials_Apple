import Foundation
import SwiftUI

struct View2: View {
    
    @Binding var medicines : [Medicine]
    @State private var selectedDate = Date()
    private let calendar = Calendar.current
    
    let CircleSizeInt : CGFloat = 42 // 원 크기
    // 제일 처음 보여주는 개체
    @State var indexBasic: Int = 5
    // 바인딩 된 Int 형태의 배열
    @State var items: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    
    
    var body: some View {
        VStack{
            let myDateComponents = DateComponents(year: 2022, month: 3, day: 01)
            let startDate = Calendar.current.date(from: myDateComponents)!
            
            let offsetComps = Calendar.current.dateComponents([.year,.month,.day], from: startDate, to: Date())
            
            if case let (y?, m?, d?) = (offsetComps.year, offsetComps.month, offsetComps.day) {
                Text("\(y)년 \(m)월 \(d)일 만큼 차이남")
            }
            
            // 바인딩 된 Int형, items = 바인딩 된 배열 형태
            SwiftUIWheelPicker($indexBasic, items: $items) { value in
                GeometryReader { reader in
                    Text("\(value)")
                        .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                }
            }
            .frame(width: 371, height: 40, alignment: .center)
            .padding(.top, 10)
        }
    }
}

#Preview {
    MedicineDaily()
}

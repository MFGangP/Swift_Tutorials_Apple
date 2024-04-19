//
//  View3.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/15/24.
//
import SwiftUI

public enum WidthOption {
    case VisibleCount(Int)
    case Fixed(CGFloat)
    case Ratio(CGFloat)
}
//SwiftUICustomSlider
public struct SwiftUIWheelPicker<Content: View, Item>: View {
    
    private var items: Binding<[Item]> // items는 바인딩 되어있는 아이템 배열 값을 가진다.
    let contentBuilder: (Item) -> Content // contentBuilder는 Item을 파라미터로 가지고 Content를 리턴하는 클로저
    @Binding var position: Int // 바인딩된 position 변수 Int형
    @GestureState private var translation: CGFloat = 0 // @GestureState는 SwiftUI에서 제스처와 관련된 상태를 관리하는 데 사용되는 속성 래퍼. 이 속성은 제스처와 상호 작용하는 동안 상태를 추적하고, 해당 상태가 변경될 때 뷰를 다시 렌더링한다.
    // 속성 래퍼(Property Wrapper) = 속성 래퍼는 속성의 값을 제어하고 해당 속성이 속한 형식의 동작을 정의하는 데 사용.
    private var contentWidthOption: WidthOption = .VisibleCount(5)
    private var sizeFactor: CGFloat = 1
    private var alphaFactor: Double = 1
    private var edgeLeftView: AnyView? = nil // edgeLeftView는 AnyView타입의 옵셔널 값이 없으면 nil 있을 수도 없을 수도
    private var edgeLeftWidth: WidthOption? = nil
    private var edgeRightView: AnyView? = nil
    private var edgeRightWidth: WidthOption? = nil
    private var centerView: AnyView? = nil
    private var centerViewWidth: WidthOption? = nil
    //private var isInfinite: Bool = false
    private var onValueChanged: ((Item) -> Void)? = nil // onValueChanged는 Item을 변수로 받고 Void를 리턴하는 closure 함수인데 옵셔널이라 기본 값은 nil
    
    public init(_ position: Binding<Int>, items: Binding<[Item]>, @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        // items 값은 Binding<[Item]>
        self._position = position
        // _position 값은 Binding<Int>
        self.contentBuilder = content
        // SwiftUIWheelPicker.contentBuilder 값에 content 클로저에서 반환받은 Content 값을 배정
    }// 초기화 함수, 생성자 init
    //_ (얘는 이름이 없다)position은 Int 값을 바인딩 하는데 사용 된다. 바인딩은 값을 저장하고 해당 값이 바뀔 때 뷰를 업데이트 하는데 사용 된다.
    // items은 배열 Item 값을 바인딩 하는데 사용된다.
    // @ViewBuilder는 여러 개의 뷰를 하나로 만드는데 사용 된다.
    // 클로져 함수의 다른 형태 Item을 인자로 받아서 Content 타입의 뷰를 반환함
    // @escaping 속성은 클로저가 함수를 벗어난 후에도 사용될 수 있음을 나타낸다.
    
    public init(_ position: Binding<Int>, items: [Item], @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = Binding.constant(items)// 바인딩 된 값은 변경 가능하지만 constant를 사용해서 변경이 불가능한 배열로 생성
        self._position = position
        self.contentBuilder = content
    }
    // items 의 값이 변경 가능한 Binding 값이 아닌 일반 배열

    public var body: some View {
        // SwiftUI에서 사용되는 뷰 컨테이너
        GeometryReader { geometry in
            // 내부적으로 여러 번의 렌더링을 수행하여 자식 뷰에 대한 정보를 제공. 이는 자식 뷰가 부모 뷰의 크기 및 레이아웃에 따라 동적으로 조정될 수 있도록 함.
            //GeometryReader는 Container View이기 때문에, 그 속에 집어넣을 Content를 클로저로 받는다. 우리에게 친숙한 VStack, HStack같은 친구들도 선언과 함께 클로저를 사용해주니까, 똑같다고 생각할 수 있다. 하지만 여기서 받는 클로저의 타입은 () -> Content가 아니라, (GeometryProxy) -> Content다. 따라서 클로저 시작 부분에 {geometry in ... } 처럼 GeometryProxy 타입의 argument를 표기해준다.
            // GeometryReader 는 상위의 View에게 할당받은 크기의 프레임 안에서 자유롭게 개체를 배치 할수 있게 도와주는 클로저
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                HStack(spacing: 0) {
                    // Foreach 0에서 items의 wrappedValue의 갯수만큼 반복
                    // id:는 값 자체를 의미 여기서는 items.wrappedValue.count 값 자체
                    ForEach(0..<items.wrappedValue.count, id: \.self) { position in
                        // postion 안에는 0 부터 items.wrappedValue.count 값이 들어감
                        drawContentView(position, geometry: geometry)
                    }
//                    ForEach(items.wrappedValue.indices) { position in
//                        drawContentView(position, geometry: geometry)
//                    }
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.position + 1) * self.calcContentWidth(geometry, option: contentWidthOption))
                .offset(x: self.translation + (geometry.size.width / 2) + (self.calcContentWidth(geometry, option: contentWidthOption) / 2))
                .animation(.interactiveSpring(), value: self.position + 1)
                .animation(.interactiveSpring(), value: translation)
                .clipped()
                if let view = edgeLeftView, let width = edgeLeftWidth {
                    view.frame(width: calcContentWidth(geometry, option: width), height: geometry.size.height, alignment: .center)
                }
                if let view = edgeRightView, let widthOption = edgeRightWidth {
                    let width = calcContentWidth(geometry, option: widthOption)
                    view
                        .offset(x: geometry.size.width - width)
                        .frame(width: width, height: geometry.size.height, alignment: .center)
                }
                if let view = centerView, let widthOption = centerViewWidth {
                    let width = calcContentWidth(geometry, option: widthOption)
                    view
                        .offset(x: geometry.size.width / 2 - width / 2)
                        .frame(width: width, height: geometry.size.height, alignment: .center)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .contentShape(Rectangle())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }
                .onEnded { value in
                    let offset = value.translation.width / self.calcContentWidth(geometry, option: contentWidthOption)
                    let newIndex = (CGFloat(self.position) - offset).rounded()
                    self.position = min(max(Int(newIndex), 0), self.items.wrappedValue.count - 1)
                    self.onValueChanged?(items.wrappedValue[self.position])
                }
            )
        }
    }
    
    public func width(_ option: WidthOption) -> Self {
        var newSelf = self
        newSelf.contentWidthOption = option
        return newSelf
    }
    
    public func scrollAlpha(_ value: Double) -> Self {
        var newSelf = self
        newSelf.alphaFactor = value
        return newSelf
    }
    
    public func scrollScale(_ value: CGFloat) -> Self {
        var newSelf = self
        newSelf.sizeFactor = value
        return newSelf
    }
    
    public func edgeLeft(_ view: AnyView, width: WidthOption) -> Self {
        var newSelf = self
        newSelf.edgeLeftView = view
        newSelf.edgeLeftWidth = width
        return newSelf
    }
    
    public func edgeRight(_ view: AnyView, width: WidthOption) -> Self {
        var newSelf = self
        newSelf.edgeRightView = view
        newSelf.edgeRightWidth = width
        return newSelf
    }
    
    public func centerView(_ view: AnyView, width: WidthOption) -> Self {
        var newSelf = self
        newSelf.centerView = view
        newSelf.centerViewWidth = width
        return newSelf
    }
    
    //public func infiniteScroll(_ value: Bool) -> Self {
    //    var newSelf = self
    //    newSelf.isInfinite = value
    //    return newSelf
    //}
    
    public func onValueChanged(_ callback: @escaping (Item) -> Void) -> Self {
        var newSelf = self
        newSelf.onValueChanged = callback
        return newSelf
    }
    // position은 Int값 geometry는 GeometryProxy를 받고 View 형태로 값을 반환하는 drawContentView 함수
    private func drawContentView(_ position: Int, geometry: GeometryProxy) -> some View {
        var sizeResult: CGFloat = 1 // 변수
        var alphaResult: Double = 1 // 변수
        // sizeFactor가 1.0이 아니거나 alphaFactor이 1.0이 아닐 경우
        if sizeFactor != 1.0 || alphaFactor != 1.0 {
            // maxRange는 geometry의
            let maxRange = floor(maxVisible(geometry) / 2.0)
            let offset = translation / self.calcContentWidth(geometry, option: contentWidthOption)
            let newIndex = CGFloat(self.position) - offset
            let posGap = CGFloat(position) - newIndex
            //let posGap = CGFloat(position) - (newIndex.truncatingRemainder(dividingBy: CGFloat(self.items.wrappedValue.count)))
            var per = abs(posGap / maxRange)
            if 1.0 < per {
                per = 1.0
            }
            
            if sizeFactor != 1.0 {
                let sizeGap = 1.0 - sizeFactor
                let preSizeRst = per * sizeGap
                sizeResult = 1 - preSizeRst
            }
            
            if alphaFactor != 1.0 {
                let alphaGap = 1.0 - alphaFactor
                let preAlphaRst = Double(per) * alphaGap
                alphaResult = 1.0 - preAlphaRst
            }
        }
        
        let item = items.wrappedValue[position]
        return contentBuilder(item)
            .scaleEffect(sizeResult)
            .opacity(alphaResult)
            .frame(width: self.calcContentWidth(geometry, option: contentWidthOption), alignment: .center)
    }
    // 함수 maxVisible은 GeometryProxy값을 받고 CGFloat으로 값을 반환한다.
    private func maxVisible(_ geometry: GeometryProxy) -> CGFloat {
        // 상수 visibleCount는 geometry.size.width(가로 값)에
        let visibleCount = geometry.size.width / self.calcContentWidth(geometry, option: contentWidthOption)
        return min(visibleCount, CGFloat(self.items.wrappedValue.count))
    }
    // 함수 calcContentWidth는 geometry에 GeometryProxy값, option에 WidthOption 값을 받아서 CGFloat 값으로 반환한다.
    private func calcContentWidth(_ geometry: GeometryProxy, option: WidthOption) -> CGFloat {
        // option 값은 3개의 상황을 가진다.
        switch option {
            // .VisibleCount일 때는 count 값을 가지고 geometry.size.width[가로 크기] / CGFloat(count) 값을 리턴한다.
        case .VisibleCount(let count):
            return geometry.size.width / CGFloat(count)
            // .Fixed 일 때는 
        case .Fixed(let width):
            return width
        case .Ratio(let ratio):
            return geometry.size.width * ratio
        }
    }
}

public struct ChildSizeReader<Content: View>: View {
    var size: Binding<CGSize>
    let content: () -> Content
    
    public init(size: Binding<CGSize>, content: @escaping () -> Content) {
        self.size = size
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: SizePreferenceKey.self, value: proxy.size)
                    }
                )
        }
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.size.wrappedValue = preferences
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero
    
    static func reduce(value _: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}
//        ScrollView(.vertical, showsIndicators: true) {
//            HStack{
//                Spacer()
//                VStack(spacing: 50) {
//                    // allCases를 통해 Enum 안에 있는 모든 케이스를 꺼내오는데, rawValue를 통해 요소가 가지고 있는 값을 반환
//                    ForEach(MedicineEnumType.allCases, id: \.self) { medicine in
//                        Text(medicine.rawValue)
//                    }
//                }
//                Spacer()
//            }
//        }
//    }
//}
//// Date 타입을 바로 받는게 아니였다.
//let monthDayFormat = Date.FormatStyle()
//    .day()
//    .month()
//    .locale(Locale(identifier: "ko_KR"))
//// 요일을 따로 추출하고 싶어서 선언한 상수
//let weekFormat = Date.FormatStyle()
//    .weekday()
//    .locale(Locale(identifier: "ko_KR"))
//// formatted()는 FormatStyle, F.FormatInput을 받는다 타입을 맞춰줘야 된다.
//let mondthDayString = medicines[0].date.formatted(monthDayFormat)
//let weekString = medicines[0].date.formatted(weekFormat)

//import Foundation
//import SwiftUI
//
//
//struct View2: View {
//    
//    @Binding var medicines : [Medicine]
//    let CircleSizeInt : CGFloat = 42
//    
//    
//    var body: some View {
//        
//        
//        // Date 타입을 바로 받는게 아니였다.
////        let monthDayFormat = Date.FormatStyle()
////            .day()
////            .month()
////            .locale(Locale(identifier: "ko_KR"))
////        // 요일을 따로 추출하고 싶어서 선언한 상수
////        let weekFormat = Date.FormatStyle()
////            .weekday()
////            .locale(Locale(identifier: "ko_KR"))
////        // formatted()는 FormatStyle, F.FormatInput을 받는다 타입을 맞춰줘야 된다.
////        let mondthDayString = medicines[0].date.formatted(monthDayFormat)
////        let weekString = medicines[0].date.formatted(weekFormat)
//        VStack{
//            // 탭이랑 띄우기 위해서 사용한 스페이서
//            Spacer()
//                .frame(minHeight: 40, maxHeight: 40)
//            Text("(오늘)")
//                .font(Font.custom("SF Pro", size: 32))
//                .lineSpacing(15)
//                .foregroundColor(.black);
//            // 날짜와 구분해주기 위한 Divider
//            Divider()
//                .background(Color.black)
//            Spacer()
//                .frame(minWidth: 20, maxWidth: 20, minHeight: 20, maxHeight: 20)
//            ScrollView(.horizontal, showsIndicators: false){
//                // 가로로 출력 되어야 하기 때문에
//                HStack{
//                    ForEach(medicines, id: \.id) { medicines in
//                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
//                                   label: {
//                                VStack{
//                                    Text("요일")
//                                        .font(Font.custom("SF Pro", size: 12))
//                                    Circle()
//                                        .frame(minWidth: CircleSizeInt, maxWidth: CircleSizeInt, minHeight: CircleSizeInt , maxHeight: CircleSizeInt)
//                                        .foregroundColor(.cyan)
//                                }// Vstack 끝
//                            }) // Button 끝
//                    }// Foreach 끝
//                    // 투약 관리 기록 부분
//                    
//                }//HStack 끝
//            }// 스크롤 뷰 끝
//            // 화면 하단 여백을 띄우기 위한 Spacer()
//            Spacer()
//        }// Vstack 끝
//    }
//}
//
//#Preview {
//    MedicineDaily()
//}








//
////
////  View2.swift
////  NC1_DailyApp
////
////  Created by lovehyun95 on 4/15/24.
////
//
//import Foundation
//import SwiftUI
//
//
//struct View2: View {
//    // 현재 선택한 날짜
//    @State private var selectedDate = Date()
//    // 현재 날짜
//    private let calendar = Calendar.current
//    // 전체 화면 구성 요소
//    var body: some View {
//      VStack(alignment: .center, spacing: 20) {
//        monthView
//        
//        ZStack {
//          dayView
//          blurView
//        }
//        .frame(height: 30)
//        .padding(.horizontal, 20)
//      }
//    }
//    
//    // MARK: - 월 표시 뷰
//    private var monthView: some View {
//      HStack(spacing: 30) {
//        Button(
//          action: {
//            changeMonth(-1)
//          },
//          label: {
//            Image(systemName: "chevron.left")
//              .padding()
//          }
//        )
//        
//        Text(monthTitle(from: selectedDate))
//          .font(.title)
//        
//        Button(
//          action: {
//            changeMonth(1)
//          },
//          label: {
//            Image(systemName: "chevron.right")
//              .padding()
//          }
//        )
//      }
//    }
//    
//    // MARK: - 일자 표시 뷰
//    @ViewBuilder
//    private var dayView: some View {
//      let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate))!
//      
//      ScrollView(.horizontal, showsIndicators: false) {
//        HStack(spacing: 10) {
//          let components = (
//            0..<calendar.range(of: .day, in: .month, for: startDate)!.count)
//            .map {
//                calendar.date(byAdding: .day, value: $0, to: startDate)!
//            }
//            
//          ForEach(components, id: \.self) { date in
//            VStack {
//              Text(day(from: date))
//                .font(.caption)
//              Text("\(calendar.component(.day, from: date))")
//            }
//            .frame(width: 30, height: 30)
//            .padding(5)
//            .background(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? Color.green : Color.clear)
//            .cornerRadius(16)
//            .foregroundColor(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .white : .black)
//            .onTapGesture {
//              selectedDate = date
//            }
//          }
//        }
//      }
//    }
//    
//    // MARK: - 블러 뷰
//    private var blurView: some View {
//      HStack {
//        LinearGradient(
//          gradient: Gradient(
//            colors: [
//              Color.white.opacity(1),
//              Color.white.opacity(0)
//            ]
//          ),
//          startPoint: .leading,
//          endPoint: .trailing
//        )
//        .frame(width: 20)
//        .edgesIgnoringSafeArea(.leading)
//        
//        Spacer()
//        
//        LinearGradient(
//          gradient: Gradient(
//            colors: [
//              Color.white.opacity(1),
//              Color.white.opacity(0)
//            ]
//          ),
//          startPoint: .trailing,
//          endPoint: .leading
//        )
//        .frame(width: 20)
//        .edgesIgnoringSafeArea(.leading)
//      }
//    }
//  }
//
//  // MARK: - 로직
//  private extension View2 {
//    /// 월 표시
//    func monthTitle(from date: Date) -> String {
//      let dateFormatter = DateFormatter()
//      dateFormatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
//      return dateFormatter.string(from: date)
//    }
//    
//    /// 월 변경
//    func changeMonth(_ value: Int) {
//      guard let date = calendar.date(
//        byAdding: .month,
//        value: value,
//        to: selectedDate
//      ) else {
//        return
//      }
//      
//      selectedDate = date
//    }
//    
//    /// 요일 추출
//    func day(from date: Date) -> String {
//      let dateFormatter = DateFormatter()
//      dateFormatter.setLocalizedDateFormatFromTemplate("E")
//      return dateFormatter.string(from: date)
//    }
//  }

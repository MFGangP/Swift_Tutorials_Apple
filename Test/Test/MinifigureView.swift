//
//  MinifigureView.swift
//  Test
//
//  Created by lovehyun95 on 5/18/24.
//

import SwiftUI
//MARK: - 임시로 사용할 Struct 구현부
struct TaskItem: Identifiable {
    // 유형, 인터페이스 및 기타 항목을 식별하는 데 사용할 수 있는 보편적으로 고유한 값.
    // 총 36개의 문자열로 구성되어 있고, 이 문자는 32개의 실제 문자(숫자 또는 알파벳)와 4개의 하이픈으로 구성
    let id: UUID = .init()
    // 이미지로 보여줄 파일 경로
    var systemName: String
}
struct villageItem: Identifiable {
    let id: UUID = .init()
    var systemName: String
    var villageBackGroundColor : Color
}
//MARK: - 캐러셀 구현부
// struct Carousel은 <> 제네릭 타입으로 View와 Items는
// Content는 View를 따라야하고, Items은 RandomAccessCollection을 따라야한다. 제네릭은 타입이 반드시 일치 해야한다.
// Carousel<Content: View, Items: RandomAccessCollection>를 통해 받아오는 뷰 또한 Items.Element: Identifiable라는 조건을 만족해야한다.
struct Carousel<Content: View, Items: RandomAccessCollection>: View where Items.Element: Identifiable {
    // 변수 data는 Items 타입
    var data: Items
    // 변수 itemWidth는 CGFloat 타입
    var itemWidth: CGFloat
    // 변수 activeID는 UUID 타입 - 옵셔널(값이 있을 수도 없을 수도)
    // State를 사용하려면 무조건 Identifiable을 따라줘야 함.
    // Binding은 뷰를 업데이트 또는 뷰 모델을 업데이트 두가지가 있고, 단방향, 양방향 바인딩이 존재함. 값이 변경되면 자동으로 @State로 보내 바디를 렌더링
    @Binding var activeID: UUID?
    // 일반적으로 하위 뷰를 만들어내는 클로저 파라미터를 위한 파라미터 어트리뷰트로 ViewBuilder를 사용한다. 이때, 이 클로저는 여러 개의 하위 뷰들을 제공할 수 있다.
    // @ViewBuilder를 붙여서 만든다면 암시적으로 해당 뷰 안에서만들어 사용하겠다는 뜻. 즉 다른 파일에서 content를 그리지 않는다는 뜻 입니다.
    // content는 Items.Element와, Bool값을 파라미터로 받고 Content를 반환
    @ViewBuilder var content: (Items.Element, Bool) -> Content
    
    var body: some View {
        // child View들의 위치나 모양을 직접 조작해야 하는 경우가 있다. 그럴 경우 사용해주는 Container View가 바로 GeometryReader다.
        // GeometryReader는 그 자체로 ‘View’이며, container 안 View 스스로의 크기와 위치를 함수로 정의한다
        GeometryReader {
            // 상수 size는 $0(클로저에서 첫번째 인수를 의미하는 약식어)의 사이즈
            let size = $0.size
            // Y축으로 쌓기
            VStack {
                // UUID 보여주기 위한 구문
                // Text(activeID?.uuidString ?? "NO UUID").bold()
                // ScrollView - 가로
                ScrollView(.horizontal) {
                    // 동적 HStack 세로 가운데 정렬
                    LazyHStack(alignment: .center) {
                        // data 갯수만큼 반복
                        ForEach(data) { item in
                            // 상수 isFocused는 Bool 타입 
                            let isFocused = isItemFocused(item)
                            // 뷰 생성
                            content(item, isFocused)
                                // 가로 itemWidth(뷰 입력시 기입받는 파라미터)를 가진 프레임
                                .frame(width: itemWidth)
                                // 외곽선 굵기 1 검은색
                                .border(.black, width: 1)
                                // 더 나아가서 스크롤 뷰의 위치에 따라 뷰를 시각적으로 변경하고 싶다면 어떻게 할까요?
                                // ScrollTransition을 통해 뷰가 스크롤 뷰의 가시 영역에 들어가거나 가시 영역을 떠날 때 적용할 수 있습니다.
                                // scrollTransition 모디파이어를 통해 content에 scaleEffect, rotationEffect, offset 등을 컨트롤 해줄 수 있죠.
                                // 얘가 캐러셀을 사용할 때 가장 주요 역할을 하게 되는 요소로 보임.
                                // 효과를 적용할 content 뷰를 받음
                                // 스크롤의 현재 상태를 나타내는 ScrollTransitionPhase 타입의 값. 이 값은 애니메이션의 다양한 단계(isIdentity 등)를 포함
                                .scrollTransition { content, phase in
                                    content
                                        // rotationEffect와 scaleEffect 두 개가 있음
                                        // 스케일을 늘리거나 줄이는 애니메이션을 주는 모디파이어
                                        .scaleEffect(
                                            // determineScaleEffect이 반환하는 값을 받아서 x, y축으로 스케일을 변환해준다.
                                            x: determineScaleEffect(phase.isIdentity),
                                            y: determineScaleEffect(phase.isIdentity)
                                        )
                                }
                        }
                        .padding(10)
                    }
                    // 가장 바깥쪽에 있는 타켓만 스크롤 대상이 되도록 하는 모디파이어
                    .scrollTargetLayout()
                    // 가로 방향, [가로 화면 - itemWidth(뷰 입력시 기입받는 파라미터) * 4.86 한 값] 만큼 띄움
                    .padding(.horizontal,  (size.width - itemWidth * 4.86))
                }
                // 뷰 내 스크롤 바 표시 여부
                .scrollIndicators(.hidden)
                // SwiftUI의 ScrollView 컴포넌트를 사용하여 스크롤링을 할때 어떤 스크롤 동작을 해줄지를 정의
                // 없던 시절에는 원하는 곳에 정확하게 스크롤 뷰가 멈춰주지 않았음.
                .scrollTargetBehavior(.viewAligned)
                // 달러($)의 의미는 Text 값이 변경되거나 스크롤을 시작할 때 마다 값이 바인딩이라는 변수로 값이 이동하게 된다는 뜻
                .scrollPosition(id: $activeID, anchor: .center)
            }
        }
    }
    // 함수 determineScaleEffect는 Bool 갑을 받아서 Double 값을 반환
    private func determineScaleEffect(_ isIdentity: Bool) -> Double {
        // 상수
        let scalePoint = 1.0
        let scaleDefault = 1.0
        // 포커스가 되어있는 상태이면 scalePoint값 반환 아니면 scaleDefault값 반환
        return isIdentity ? scalePoint : scaleDefault
    }
    // 함수 isItemFocused는 Iteams.Element 타입을 파라미터로 받고 Bool 값을 반환한다.
    private func isItemFocused(_ item: Items.Element) -> Bool {
        // item.id 값이 activeID(UUID? 옵셔널)와 같다면
        // 참이면 true 거짓이면 false - as? 연산자는 타입 캐스팅이 실패할 경우 nil을 반환.
        
        // activeID를 Items.Element.ID 타입으로 안전하게 캐스팅(형변환)합니다.
        // activeID는 UUID? 타입입니다. item.id는 Items.Element.ID 타입입니다.
        // Items.Element가 Identifiable 프로토콜을 따르기 때문에 ID 타입을 가지고 있지만, 이는 UUID일 수도 있고 다른 타입일 수도 있습니다.두 타입이 항상 동일하지 않을 수 있으므로 비교하기 전에 타입을 맞춰야 합니다.
        return item.id == activeID as? Items.Element.ID
    }
}
//MARK: - 빌리지 캐러셀 구현부
// struct Carousel은 <> 제네릭 타입으로 View와 Items는
// Content는 View를 따라야하고, Items은 RandomAccessCollection을 따라야한다. 제네릭은 타입이 반드시 일치 해야한다.
// Carousel<Content: View, Items: RandomAccessCollection>를 통해 받아오는 뷰 또한 Items.Element: Identifiable라는 조건을 만족해야한다.
struct villageCarousel<Content: View, Items: RandomAccessCollection>: View where Items.Element: Identifiable {
    // 변수 data는 Items 타입
    var data: Items
    // 변수 itemWidth는 CGFloat 타입
    var itemWidth: CGFloat
    // 변수 activeID는 UUID 타입 - 옵셔널(값이 있을 수도 없을 수도)
    // State를 사용하려면 무조건 Identifiable을 따라줘야 함.
    // Binding은 뷰를 업데이트 또는 뷰 모델을 업데이트 두가지가 있고, 단방향, 양방향 바인딩이 존재함. 값이 변경되면 자동으로 @State로 보내 바디를 렌더링
    @Binding var activeID: UUID?
    // 일반적으로 하위 뷰를 만들어내는 클로저 파라미터를 위한 파라미터 어트리뷰트로 ViewBuilder를 사용한다. 이때, 이 클로저는 여러 개의 하위 뷰들을 제공할 수 있다.
    // @ViewBuilder를 붙여서 만든다면 암시적으로 해당 뷰 안에서만들어 사용하겠다는 뜻. 즉 다른 파일에서 content를 그리지 않는다는 뜻 입니다.
    // content는 Items.Element와, Bool값을 파라미터로 받고 Content를 반환
    @ViewBuilder var content: (Items.Element, Bool) -> Content
    
    var body: some View {
        // child View들의 위치나 모양을 직접 조작해야 하는 경우가 있다. 그럴 경우 사용해주는 Container View가 바로 GeometryReader다.
        // GeometryReader는 그 자체로 ‘View’이며, container 안 View 스스로의 크기와 위치를 함수로 정의한다
        GeometryReader {
            // 상수 size는 $0(클로저에서 첫번째 인수를 의미하는 약식어)의 사이즈
            let size = $0.size
            // Y축으로 쌓기
            VStack {
                // UUID 보여주기 위한 구문
                // Text(activeID?.uuidString ?? "NO UUID").bold()
                // ScrollView - 가로
                ScrollView(.horizontal) {
                    // 동적 HStack 세로 가운데 정렬
                    LazyHStack(alignment: .center) {
                        // data 갯수만큼 반복
                        ForEach(data) { item in
                            // 상수 isFocused는 Bool 타입
                            let isFocused = isItemFocused(item)
                            // 뷰 생성
                            content(item, isFocused)
                                // 가로 itemWidth(뷰 입력시 기입받는 파라미터)를 가진 프레임
                                .frame(width: itemWidth)
                                // 외곽선 굵기 1 검은색
                                .border(.black, width: 1)
                                // 더 나아가서 스크롤 뷰의 위치에 따라 뷰를 시각적으로 변경하고 싶다면 어떻게 할까요?
                                // ScrollTransition을 통해 뷰가 스크롤 뷰의 가시 영역에 들어가거나 가시 영역을 떠날 때 적용할 수 있습니다.
                                // scrollTransition 모디파이어를 통해 content에 scaleEffect, rotationEffect, offset 등을 컨트롤 해줄 수 있죠.
                                // 얘가 캐러셀을 사용할 때 가장 주요 역할을 하게 되는 요소로 보임.
                                // 효과를 적용할 content 뷰를 받음
                                // 스크롤의 현재 상태를 나타내는 ScrollTransitionPhase 타입의 값. 이 값은 애니메이션의 다양한 단계(isIdentity 등)를 포함
                                
                        }
                        .padding(10)
                    }
                    // 가장 바깥쪽에 있는 타켓만 스크롤 대상이 되도록 하는 모디파이어
                    .scrollTargetLayout()
                    // 가로 방향, [가로 화면 - itemWidth(뷰 입력시 기입받는 파라미터)  / 2 - 10 한 값] 만큼 띄움
                    .padding(.horizontal, (size.width - itemWidth) / 2 - 10)
                }
                // 뷰 내 스크롤 바 표시 여부
                .scrollIndicators(.hidden)
                // SwiftUI의 ScrollView 컴포넌트를 사용하여 스크롤링을 할때 어떤 스크롤 동작을 해줄지를 정의
                // 없던 시절에는 원하는 곳에 정확하게 스크롤 뷰가 멈춰주지 않았음.
                .scrollTargetBehavior(.viewAligned)
                // 달러($)의 의미는 Text 값이 변경되거나 스크롤을 시작할 때 마다 값이 바인딩이라는 변수로 값이 이동하게 된다는 뜻
                .scrollPosition(id: $activeID, anchor: .center)
            }
        }
    }
    
    // 함수 isItemFocused는 Iteams.Element 타입을 파라미터로 받고 Bool 값을 반환한다.
    private func isItemFocused(_ item: Items.Element) -> Bool {
        // item.id 값이 activeID(UUID? 옵셔널)와 같다면
        // 참이면 true 거짓이면 false - as? 연산자는 타입 캐스팅이 실패할 경우 nil을 반환.
        
        // activeID를 Items.Element.ID 타입으로 안전하게 캐스팅(형변환)합니다.
        // activeID는 UUID? 타입입니다. item.id는 Items.Element.ID 타입입니다.
        // Items.Element가 Identifiable 프로토콜을 따르기 때문에 ID 타입을 가지고 있지만, 이는 UUID일 수도 있고 다른 타입일 수도 있습니다.두 타입이 항상 동일하지 않을 수 있으므로 비교하기 전에 타입을 맞춰야 합니다.
        return item.id == activeID as? Items.Element.ID
    }
}
//MARK: - MinifigureView 구현부
struct MinifigureView: View {
    // 이미지 경로를 알려주기 위한 변수
    var systemName: String
    // 선택 되었는지 여부를 확인하기 위한 변수
    var isFocused: Bool = false
    
    // 사각형 사이즈
    private let RectangleSize: CGFloat = 30
    // 이미지 사이즈
    private let imageSize: CGFloat = 30
    
    var body: some View {
                VStack {
                    // 이미지 에셋에서 불러온다.
                    Image(systemName)
                        .resizable()
                    // 폰트는 body
                        .font(.body)
                        .bold(isFocused)
                        .frame(width: 74, height: 104)
        }
    }
}
//MARK: - VillageView 구현부
struct VillageView: View{
    var systemName: String
    var villageBackGroundColor : Color
    
    var body: some View{
        HStack{
            ZStack{
                // 테마를 보여줄 카드 생성
                RoundedRectangle(cornerRadius: 12.0)
                // 배경 색깔
                    .fill(villageBackGroundColor)
                // 사각형 크기 - Figma
                    .frame(width: 330, height: 226)
                // 그림자 효과
                    .shadow(color: .gray, radius: 5) // , x: -5
                    // .padding()
                Image(systemName)
                    .resizable()
                    .frame(width: 266, height: 216)
            }
        }
    }
}
    #Preview {
        ContentView()
    }

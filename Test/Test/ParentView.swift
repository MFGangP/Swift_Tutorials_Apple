//
//  ParentView.swift
//  Test
//
//  Created by lovehyun95 on 5/18/24.
//

import SwiftUI
// ParentView 뷰 생성 - 뷰 타입
struct ParentView: View {
    // State를 사용하려면 무조건 Identifiable을 따라줘야 함.
    // State는 변수가 변경 될 때마다 body를 다시 렌더링 한다는 의미.
    @State var scrolledID: UUID?
    // 미니 피규어 테스트 리스트
    @State var items: [TaskItem] = [
        .init(systemName: "image65"),
        .init(systemName: "image65"),
        .init(systemName: "image65"),
        .init(systemName: "image65"),
        .init(systemName: "image65"),
        .init(systemName: "image65")
    ]
    // 레고 빌리지 테스트 리스트
    @State var villageImage: [villageItem] = [
        .init(villageImageString: "Village", villageBackGroundColor: .yellow),
        .init(villageImageString: "Village", villageBackGroundColor: .blue),
        .init(villageImageString: "Village", villageBackGroundColor: .mint),
        .init(villageImageString: "Village", villageBackGroundColor: .cyan),
        .init(villageImageString: "Village", villageBackGroundColor: .green),
        .init(villageImageString: "Village", villageBackGroundColor: .brown)
    ]
    let textLeftedge : CGFloat = 30
    init() {
        if let firstItemID = items.first?.id {
            _scrolledID = State(initialValue: firstItemID)
        }
    }
    
    var body: some View {
        // 탭 뷰 마다 네비게이션 뷰가 있어야 제목을 띄울 수 있다. 탭 뷰가 최상위
        NavigationStack(){
            ScrollView{
                // Y축으로 쌓기
                // 빌리지 캐러셀 뷰
                VStack{
                    HStack(alignment: .bottom){
                        Text("My LEGO Village")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }.padding(.leading, textLeftedge)
                    ZStack{
                        // 빌리지 캐러셀 뷰 호출
                        villageCarousel(data: villageImage, itemWidth: 315, activeID: $scrolledID){item, isFocused  in
                            VillageView(villageImageString: item.villageImageString, villageBackGroundColor: item.villageBackGroundColor)
                        }
                    }.frame(width: 375,height: 245)
                    Spacer(minLength: 30)
                    // 미니 피규어 카테고리 Zstack
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            //.border(Color.black)
                            .frame(width: 393, height: 207)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 7.40)
                        VStack{
                            // 여백 줄이기 위한 Spacer - 글자랑 이미지랑 붙이기 위해
                            Spacer(minLength: 10)
                            // 텍스트 입력을 위한 HStack
                            HStack(alignment: .bottom){
                                Text("Harry Potter")
                                    .font(.title2)
                                    .bold()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 22))
                                    .foregroundColor(.gray)
                                Spacer()
                            }.padding(.leading, textLeftedge)
                            // 캐러셀 뷰를 호출
                            Carousel(data: items, itemWidth: 55, activeID: $scrolledID) { item, isFocused in
                                MinifigureView(systemName: item.systemName, isFocused: isFocused)
                            }
                            // 여백 줄이기 위한 Spacer - 글자랑 이미지랑 붙이기 위해
                            Spacer(minLength: 10)
                        }.frame(width: 393, height: 180)
                    }
                    // 미니 피규어 카테고리 Zstack
                    ZStack{
                        VStack{
                            // 여백 줄이기 위한 Spacer - 글자랑 이미지랑 붙이기 위해
                            Spacer(minLength: 10)
                            // 텍스트 입력을 위한 HStack
                            HStack(alignment: .bottom){
                                Text("Collectible Minifigures")
                                    .font(.title2)
                                    .bold()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 22))
                                    .foregroundColor(.gray)
                                Spacer()
                            }.padding(.leading, textLeftedge)
                            Spacer()
                            // 캐러셀 뷰를 호출
                            Carousel(data: items, itemWidth: 55, activeID: $scrolledID) { item, isFocused in
                                MinifigureView(systemName: item.systemName, isFocused: isFocused)
                            }
                            // 여백 줄이기 위한 Spacer - 글자랑 이미지랑 붙이기 위해
                            Spacer(minLength: 10)
                        }.frame(width: 393, height: 180)
                    }
                }
                // 네비게이션 바 타이틀
                .navigationBarTitle("Minifigures")
                // 네비게이션 바 표시 스타일 자동
                .navigationSplitViewStyle(.automatic)
                // 여유 공간
                .padding()
            }
        }
    }
}
#Preview {
    ContentView()
}

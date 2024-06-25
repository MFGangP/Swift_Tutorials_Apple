//
//  SpotifyHomeView.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/23/24.
//

import SwiftUI


struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical){
                // pinnedView는 뭐하는 역할인가?
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    // 섹션이 어떤 역할이고
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 200, height: 200)
                        }
                    // 여기서 나오는 헤더는 무슨 역할을 하는 것인가?
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            // clipped()를 쓰면 Area 밖으로 Rectangle이 나가는걸 방지해줌
            .clipped()
        }
        .task {
            await getData()
        }
        // 얘는 무슨 역할인가.
        .toolbar(.hidden, for: .navigationBar)
    }
    private func getData() async {
        do {
            // 유저 목록을 불러와서 첫번째 유저를 넣어준다.
            currentUser = try await DatabaseHelper().getUsers().first
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0){
            ZStack{
                if let currentUser {
                    ImageLoaderView(urlString:
                                        currentUser.image)
                    // 혹시나 png 같은 배경이 없는 사진이 나왔을 때 뒷 배경이랑 구분 되라고 넣어줌
                    .background(.spotifyWhite)
                    // 사진을 잘라주는 역할
                    .clipShape(Circle())
                    // 나중에 눌렸을 때 프로필로 연결되게 해야하니까 넣어줌.
                    .onTapGesture {
                        
                    }
                }
            }
            .frame(width: 35, height: 35)
            
            // 선택되는 메뉴를 만들기위해
            ScrollView(.horizontal){
                // 가로로 간격을 8 픽셀
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            //
                            title: category.rawValue.capitalized,
                            // 선택된 카테고리가 현재 카테고리와 같은가 Bool 타입 리턴으로 체크
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            // 클릭하면 선택된 카테고리는 현재 내가 눌린 카테고리
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        // 오른쪽에 horizontal로 잡아준 여백이 잘라먹는 사태를 방지하고자 왼쪽만 띄워준다.
        .padding(.leading, 8)
        
    }
}

#Preview {
    SpotifyHomeView()
}

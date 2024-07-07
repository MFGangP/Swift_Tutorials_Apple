//
//  SpotifyHomeView.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/23/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    // 로그인이 안되어있는 상황도 있을 수 있으니까 nil로 초기화 해주는 것.
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical){
                // pinnedView는 뭐하는 역할인가?, [.sectionHeaders]는 뭐하는 역할인가?
                LazyVStack(spacing: 1,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    // 섹션이 어떤 역할이고
                    Section {
                        VStack(spacing: 16){
                            recentsSection
                                .padding(.horizontal, 16)
                            // 옵션 + 엔터
                            // 컨트롤 + M
                            if let product = products.first{
                                newReleaseSection(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                            
                        }
                        // 여기서 나오는 헤더는 무슨 역할을 하는 것인가?
                    }header: {
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
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            // compactMap은 map이랑 다르게 nil값이 아닌 값만 매핑해준다
            let allBrands = Set(products.compactMap({ $0.brand }))
            for brand in allBrands {
                // let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
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
                    // 모든 케이스를 다 꺼내준다.
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            // 그냥 카테고리만 쓰면 all이라는 인스턴스만 나온다.
                            // rawValue = all을 String 값으로 바꿔준다.
                            // capitalized 첫번째 단어를 대문자
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
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) {
            product in
            if let product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                )
                .asButton(.press){
                    
                }
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: {
                
            },
            onPlayPressed: {
                
            }
        )
    }
    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8){
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal){
                    HStack(alignment: .top, spacing: 16){
                        ForEach(row.products) { product in
                            ImageTitleRowCell(
                                imageSize: 120,
                                imageName: product.firstImage,
                                title: product.title
                            )
                            .asButton(.press) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}


#Preview {
    SpotifyHomeView()
}

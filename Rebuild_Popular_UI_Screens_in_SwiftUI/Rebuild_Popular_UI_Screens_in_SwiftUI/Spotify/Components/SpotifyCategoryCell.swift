//
//  SpotifyCategoryCell.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/23/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
        // extension이 모디파이어에 사용되네?
            .themeColor(isSelected: isSelected)
//            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
//            .foregroundColor(isSelected ? .spotifyBlack : .spotifyWhite)
            .cornerRadius(16)
        
    }
}
// extension의 정확한 의미는 무엇일까?
// extension을 쓰는 이유는 스위프트가 만들어놓은 기능 이외에 내가 만들고 싶은 기능을 추가하고 싶을때 사용하는 부분.
// View라는 프로토콜을 체택하는 곳이 있으면 모두 사용할 수 있다 - 중복되는 부분
extension View {
    func themeColor(isSelected : Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundColor(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack(spacing : 40){
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSelected: true)
        }
    }
}

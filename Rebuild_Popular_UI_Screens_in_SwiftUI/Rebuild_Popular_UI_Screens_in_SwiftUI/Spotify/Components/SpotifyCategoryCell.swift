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
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundColor(isSelected ? .spotifyBlack : .spotifyWhite)
            .cornerRadius(16)
        
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

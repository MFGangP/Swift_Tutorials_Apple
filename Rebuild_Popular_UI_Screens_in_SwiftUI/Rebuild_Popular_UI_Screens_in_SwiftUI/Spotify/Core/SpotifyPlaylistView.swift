//
//  SpotifyPlaylistView.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 7/9/24.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                    height: 250,
                    title: product.title,
                    subtitle: product.brand!,
                    imageName: product.thumbnail
                    )
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: "Nick",
                        subheadline: product.category!,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}

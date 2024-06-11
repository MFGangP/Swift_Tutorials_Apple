//
//  ImageLoaderView.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString : String = ""
    
    var body: some View {
        WebImage(url: URL(string: <#T##String#>))
    }
}

#Preview {
    ImageLoaderView()
}

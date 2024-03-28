//
//  ContentView.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Turtle Rock")
                .font(.title)
                .foregroundStyle(.black)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

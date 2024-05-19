//
//  ContentView.swift
//  Test
//
//  Created by lovehyun95 on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
              Text("The First Tab")
                .tabItem {
                  Image(systemName: "1.square.fill")
                  Text("First")
                }
            ParentView()
                .tabItem {
                    Image(systemName: "batteryblock")
                    Text("Minifigure")
                }
              Text("Another Tab")
                .tabItem {
                  Image(systemName: "2.square.fill")
                  Text("Second")
                }
              Text("The Last Tab")
                .tabItem {
                  Image(systemName: "3.square.fill")
                  Text("Third")
                }
                // .badge(10)
            }
            .font(.headline)
    }
}

#Preview {
    ContentView()
}

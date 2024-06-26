//
//  ContentView.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/11/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users : [User] = []
    @State private var products : [Product] = []
    
    var body: some View {
        ScrollView{
            VStack{
                // 스위프트가 내부에서 구분이 가능한 상태여야 ForEach를 사용할 수 있다.
                // String은 Hash 함수를 통해서 구분이 가능한 값이 나오기 때문에 id값으로 사용할 수 있음.
//                ForEach(users) { user in
//                    Text(user.firstName)
//                }
                ForEach(products) { product in
                    Text(product.title)
                }
            }
        }
        .padding()
        // 화면이 호출되는 동시에 내부에 있는 매서드를 호출하고, 시간이 걸리고 있는데 화면이 등장을 하고 작업이 완료되기 전에 사용자가 나가면 작업을 종료해준다.
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}

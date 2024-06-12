//
//  DatabaseHelper.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/11/24.
//

import Foundation

struct DatabaseHelper{
    // getProducts() 함수는 [String] 배열을 반환한다.
    // 작업을 할 때 리소스를 계속 점유하지 않고 반환을 한 다음 응답이 왔을 경우 이어서 사용하게 하기 위함.
    // async 얘를 달아놓음으로써 비동기 처리가 가능한 함수라고 알려줌.
    func getProducts() async throws -> [Product] {
        // if문과의 차이점으로 보면 if문은 '~면 ~해라' 의 실행 구문이지만, guard는 '~아니면 끝내라' 라는 의미 그래서 throw나 return을 해줘야한다.
        // 에러체인이라고 해서 에러가 생겼을 때 상위 호출자에게 던질지 아니면 내가 받아서 해결할 지 선택해야한다.
        guard let url = URL(string: "https://dummyjson.com/products") else
        {
            throw URLError(.badURL)
        }
        // 비동기 함수를 부르는 비동기 함수. 컴플리션 핸들러-
        // 비동기 함수를 쓸 때 await를 키워드를 써서 알려주는 역할.
        // 에러를 띄울 수 있는 함수를 쓸 때 try를 통해 에러를 던져줄 수 있음을 암시함.
        // data는 비동기 형식으로 (Data, URLResponse) 값을 반환한다.
        let (data, _) = try await URLSession.shared.data(from: url)
        // 디코더가 ProductArray Json 형식을 풀어서 ProductArray에 저장.
        // .self <= ProductArray 자체의 타입을 보고 데이터를 디코딩해서 넣어줘라.
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
    }
    
    func getUsers() async throws -> [User] {
        // if문과의 차이점으로 보면 if문은 '~면 ~해라' 의 실행 구문이지만, guard는 '~아니면 끝내라' 라는 의미 그래서 throw나 return을 해줘야한다.
        guard let url = URL(string: "https://dummyjson.com/users") else
        {
            throw URLError(.badURL)
        }
        // data는 비동기 형식으로 (Data, URLResponse) 값을 반환한다.
        let (data, _) = try await URLSession.shared.data(from: url)
        // 디코더가 ProductArray Json 형식을 풀어서 UserArray에 저장.
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }
}



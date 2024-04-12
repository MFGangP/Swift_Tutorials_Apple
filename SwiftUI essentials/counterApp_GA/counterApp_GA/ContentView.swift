//
//  ContentView.swift
//  counterApp_GA
//
//  Created by lovehyun95 on 4/12/24.
//

import SwiftUI

struct ContentView: View {
    // 값이 변경 되었을 때 뷰에 반영되게 하기 위해서 @State를 사용한다.
    @State var count: Int = 0
    let countStandard = 4
    // var body 자체도 변수이기 때문에 안에 다른 변수를 선언해주는건 불가능하다.
    // 조건을 걸어주는 건 가능
    var body: some View {
        Text("counter \(count)")
        if count > countStandard {
            Text("Done!")
        }else{
            Text("Not Yet")
        }
        Button(action: {
            plus()
            // count += 1
        }, label: {
            Text("+")
        })
        Button(action: {
            minus()
            // count -= 1
        }, label: {
            Text("-")
        })
    }
    
    // 함수 안에 view와 관련된 값을 넣는 것도 불가능하다.
    func plus(){
        count += 1
    }
    func minus(){
        count -= 1
    }
}

#Preview {
    ContentView()
}

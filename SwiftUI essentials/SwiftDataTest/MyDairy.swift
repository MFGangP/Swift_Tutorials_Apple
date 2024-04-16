//
//  MyDairy.swift
//  SwiftDataTest
//
//  Created by lovehyun95 on 4/16/24.
//

import SwiftUI

struct Dairy {
    var 날짜 : String
    var 날씨 : String
    var 제목 : String
    var 내용 : String
    var 존재여부 : Bool
}

struct MyDairy: View {
    // 이렇게만 되어도 반복문을 타면서 뽑아 올 수 있다.
    //    @State var dairies = [
    //        ["4월 13일", "cloud", "그런데 말입니다.", "오늘은 날씨가 맑았어요 그래서 밖에 나갔습니다."],
    //        ["4월 13일", "cloud", "그런데 말입니다.", "오늘은 날씨가 맑았어요 그래서 밖에 나갔습니다."],
    //        ["4월 13일", "cloud", "그런데 말입니다.", "오늘은 날씨가 맑았어요 그래서 밖에 나갔습니다."]
    // dairise의 날짜, 날씨, 제목, 내용
    @State var dairies : [Dairy] = [
        Dairy(날짜: "4월 13일",
              날씨: "cloud",
              제목: "그런데 말입니다.",
              내용: "오늘은 날씨가 맑았어요 그래서 밖에 나갔습니다.",
              존재여부: false),
        Dairy(날짜: "4월 13일",
              날씨: "cloud",
              제목: "그런데 말입니다.",
              내용: "오늘은 날씨가 맑았어요 그래서 밖에 나갔습니다.",
              존재여부: false),
        Dairy(날짜: "4월 13일",
              날씨: "cloud",
              제목: "그런데 말입니다.",
              내용: "오늘은 날씨가 맑았어요 그래서 밖에 나갔습니다.",
              존재여부: false)
    ]
    var body: some View {
        List{
            ForEach(0..<5) { _ in
                //
                if true {
                    VStack(alignment: .leading) {
                        HStack{
                            Text("4월 13일") // 날짜
                            Spacer()
                            Image(systemName: "cloud") // 날씨
                        }
                        Text("\(dairies[0].제목)")//제목
                        Text("\(dairies[0].내용)")//내용
                    }
                }
                
            }
        }
    }
}

#Preview {
    MyDairy()
}

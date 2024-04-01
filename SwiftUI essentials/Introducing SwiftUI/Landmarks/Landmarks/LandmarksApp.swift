//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // @State 속성을 사용하여 View 내 속성을 초기화하는 것과 동일하게 모델 개체를 초기화합니다.
    // SwiftUI는 View의 수명 동안 한 번만 보기의 상태를 초기화하는 것과 마찬가지로 앱의 수명 동안 한 번만 앱의 상태를 초기화합니다.
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}

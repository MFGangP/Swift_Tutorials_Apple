//
//  ModelData.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import Foundation

// Observable 매크로를 사용하여 새 클래스를 선언
// SwiftUI는 관찰자 속성이 변할 때 와 View body가 속성을 직접 읽을 때 업데이트 된다.
@Observable
class ModelData {
    // command + option + { 또는 } 로 줄을 한 줄 씩 옮길 수 있다.
    var landmarks: [Landmark] = load("landmarkData.json")
}


// 변수 landmarks는 Landmark 리스트 형식을 따르고 "landmarkData.json"를 불러서 대입
// 함수
func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

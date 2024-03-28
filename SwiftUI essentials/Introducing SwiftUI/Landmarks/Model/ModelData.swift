//
//  ModelData.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import Foundation
// 변수 landmarks는 Landmark 리스트 형식을 따르고 "landmarkData.json"를 불러서 대입
var landmarks: [Landmark] = load("landmarkData.json")
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

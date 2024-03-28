//
//  Landmark.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import Foundation
import SwiftUI

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // 이미지 이름
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    
    private var coordinates: Coordinates
    
    
    struct Coordinates : Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

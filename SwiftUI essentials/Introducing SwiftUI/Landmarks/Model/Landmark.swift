//
//  Landmark.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    // 좋아요 표시하기 위한 Bool타입 선언
    var isFavorite: Bool
    
    // 이미지 이름
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates : Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

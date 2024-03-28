//
//  Landmark.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import Foundation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
}

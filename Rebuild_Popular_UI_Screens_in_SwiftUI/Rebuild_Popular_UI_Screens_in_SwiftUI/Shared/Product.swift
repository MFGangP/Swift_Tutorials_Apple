//
//  Product.swift
//  Rebuild_Popular_UI_Screens_in_SwiftUI
//
//  Created by lovehyun95 on 6/12/24.
//

import Foundation
// 불러오기위해서 당사자도 Codable을 채용해야한다.
struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}
// 타입을 내가 원하는 방식으로 편하게 사용하기위해 사용
// Decodable = 스위프트에서 사용하기 위한 Json 파일을 번역
// Encodable
struct Product: Codable, Identifiable{
    let id: Int
    let title, description: String
    let price : Double //
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String?
    let thumbnail: String
    let images: [String]
    
    var firstImage: String{
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Example product title",
            description: "This is some mock product description that goes here",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            category: "Electronic Devices",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage]
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}

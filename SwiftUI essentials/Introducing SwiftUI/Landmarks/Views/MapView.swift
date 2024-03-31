//
//  MapView.swift
//  Landmarks
//
//  Created by lovehyun95 on 3/28/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        // Map(initialPosition: .region(region))
        // 값이 변경되면 업데이트 되도록 위치 입력을 받게 변경
        Map(position: .constant(.region(region)))
        // 양방향 연결
    }
    
    // 지도의 지역 정보를 보유하는 변수 선언
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            // 매개변수에 지역변수 좌표를 전달
            center: coordinate,
            // center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    //
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}

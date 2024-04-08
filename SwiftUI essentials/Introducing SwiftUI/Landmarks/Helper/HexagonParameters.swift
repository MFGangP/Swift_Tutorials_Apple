//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by lovehyun95 on 4/8/24.
//

import CoreGraphics

struct HexagonParameters {
    struct Segment{
        // 육각형의 한 면을 나타내는 세 개의 점을 유지하는 구고를 정의
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let adjustment: CGFloat = 0.085
    
    // 세드먼트를 보관할 배열을 만든다.
    static let segments = [
        // 육각형의 각 측면에 대해 하나씩, 6개 세그먼트에 대한 데이터를 추가
        Segment(line: CGPoint(x: 0.60, y: 0.05),
                curve: CGPoint(x: 0.40, y: 0.05),
                control: CGPoint(x: 0.50, y: 0.00)
               ),
        // 육각형의 모양을 조정할 수 있는 조정 값을 추가
        Segment(line: CGPoint(x: 0.05, y: 0.20 + adjustment),
                curve: CGPoint(x: 0.00, y: 0.30 + adjustment),
                control: CGPoint(x: 0.00, y: 0.25 + adjustment)
               ),
        Segment(line: CGPoint(x: 0.00, y: 0.70 - adjustment),
                curve: CGPoint(x: 0.05, y: 0.80 - adjustment),
                control: CGPoint(x: 0.00, y: 0.75 - adjustment)
               ),
        Segment(line: CGPoint(x: 0.40, y: 0.95),
                curve: CGPoint(x: 0.60, y: 0.95),
                control: CGPoint(x: 0.50, y: 1.00)
               ),
        Segment(line: CGPoint(x: 0.95, y: 0.80 - adjustment),
                curve: CGPoint(x: 1.00, y: 0.70 - adjustment),
                control: CGPoint(x: 1.00, y: 0.75 - adjustment)
               ),
        Segment(line: CGPoint(x: 1.00, y: 0.30 + adjustment),
                curve: CGPoint(x: 0.95, y: 0.20 + adjustment),
                control: CGPoint(x: 1.00, y: 0.25 + adjustment)
               ),
    ]
}

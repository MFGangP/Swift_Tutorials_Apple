//
//  View3.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/15/24.
//

import SwiftUI

import Foundation
import SwiftUI

struct View3: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack{
                Spacer()
                VStack(spacing: 50) {
                    // allCases를 통해 Enum 안에 있는 모든 케이스를 꺼내오는데, rawValue를 통해 요소가 가지고 있는 값을 반환
                    ForEach(MedicineEnumType.allCases, id: \.self) { medicine in
                        Text(medicine.rawValue)
                    }
                }
                Spacer()
            }
        }
    }
}


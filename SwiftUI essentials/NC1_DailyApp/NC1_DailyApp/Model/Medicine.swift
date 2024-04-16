//
//  Medicine.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/15/24.
//

import Foundation
// 이번 챌린지로 이거 두개 써보기
// RawValue
// CaseIterable
enum MedicineEnumType: String, CaseIterable {
    case capsule = "캡슐"
    case tablet = "알약"
    case liquid = "액체"
    case lotion = "로션"
    case ointment = "연고"
    case topical = "국소성"
    case cream = "크림"
    case gel = "젤"
    case device = "기기"
    case spray = "분무제"
    case drip = "점적"
    case suppository = "좌약"
    case injection = "주사"
    case powder = "파우더"
    case patch = "패치"
    case form = "폼"
    case inspirator = "흡입기"
}

enum MedicineEnumVolume: String, CaseIterable {
    case milligram = "mg"
    case microgram = "mcg"
    case gram = "g"
    case millilitre = "ml"
    case percent = "%"
}
//VStack {
//        // allCases를 통해 Enum 안에 있는 모든 케이스를 꺼내오는데, rawValue를 통해 요소가 가지고 있는 값을 반환
//        ForEach(MedicineEnumType.allCases, id: \.self) { medicine in
//            Text(medicine.rawValue)
//        }
//}

// 캡슐, 정제, 액체, 국소성
// 로션, 연고, 크림, 젤, 기기, 분무제, 점적, 좌약, 주사, 파우더, 패치, 폼, 흡입기
struct Medicine {
    let medicineName : String
    let medicineType : MedicineEnumType
    let medicineVolume : Int
    let medicineUnit : MedicineEnumVolume
    let medicineFrequency : UInt8
    let administrationTime : Date
    let medicineShape : String
    let medicineLeftColor : Int
    let medicineRightColor : Int
    let backgroundColor : Int
}

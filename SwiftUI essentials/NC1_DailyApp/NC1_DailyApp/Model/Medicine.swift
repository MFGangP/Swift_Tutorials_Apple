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

// 약 종류
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
// 약 용량
enum MedicineEnumVolume: String, CaseIterable {
    case milligram = "mg"
    case microgram = "mcg"
    case gram = "g"
    case millilitre = "ml"
    case percent = "%"
}
// 아픈 관절 부위
enum ArticulationList: String, CaseIterable {
    case finger = "손가락"
    case wrist = "손목"
    case elbow = "팔꿈치"
    case shoulder = "어깨"
    case toes = "발가락"
    case ankle = "발목"
    case knee = "무릎"
    case chin = "턱"
    case neck = "목"
    case waist = "허리"
}
// 좌우 구분
enum ArticulationDirection: String, CaseIterable{
    case left = "왼쪽"
    case right = "오른쪽"
}
// 아픈 관절 번호
enum FingerAndToesNum: String, CaseIterable {
    case first = "첫번째 마디"
    case second = "두번째 마디"
    case third = "세번째 마디"
}
//


//VStack {
//        // allCases를 통해 Enum 안에 있는 모든 케이스를 꺼내오는데, rawValue를 통해 요소가 가지고 있는 값을 반환
//        ForEach(MedicineEnumType.allCases, id: \.self) { medicine in
//            Text(medicine.rawValue)
//        }
//}

// 캡슐, 정제, 액체, 국소성
// 로션, 연고, 크림, 젤, 기기, 분무제, 점적, 좌약, 주사, 파우더, 패치, 폼, 흡입기

struct Medicine {
    var id = UUID()
    var date: Date
    var medicineDetail: [MedicineDetail]
    var painDetail: [PainDetail]
}

struct MedicineDetail {
    let medicineName : String // 약 이름
    let medicineType : MedicineEnumType // 약 종류
    let medicineVolume : Int // 약 용량
    let medicineUnit : MedicineEnumVolume // 용량 단위
    let medicineFrequency : Int // 복용 주기
    let administrationTime : Date // 복용 시간 hh:MM 시간, 분
    let medicineShape : String // 약 생김새 - 이미지
    let medicineLeftColor : String // 약 색깔 - 왼쪽
    let medicineRightColor : String // 약 색깔 - 오른쪽
    let medicineTakingDate : Date // 약 복용 날짜
    let backgroundColor : String // 약 배경 색깔
}

struct PainDetail {
    let painPart : ArticulationList // 아픈 관절 부위
    let painPartNumber : FingerAndToesNum // 아픈 관절 번호
    let painPartAttendants : ArticulationDirection // 통증 좌우 위치
    let painDegree : Int // 통증 정도
    let painDate : Date // 통증 기간
}

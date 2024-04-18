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
// 통증 정도
enum PainDegree : Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
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
    var id = UUID()
    var date: Date
    var medicineDetail: [MedicineDetail]
    var painDetail: [PainDetail]
}

struct MedicineDetail {
    var id = UUID() // 약 등록 순번 - 이게 있어야 순서대로 불러올 것 같음.
    var medicineName : String // 약 이름
    var medicineType : MedicineEnumType // 약 종류 (알약, 정제)
    var medicineVolume : Int // 약 용량 [XX]ml
    var medicineUnit : MedicineEnumVolume // 용량 단위 (ml, g, mg...)
    var medicineFrequency : Int // 복용 주기 - 1일 ~ 99일
    var administrationTime : Date // 복용 시간 hh:MM 시간, 분
    var medicineShape : String // 약 생김새 - 이미지 - 블랜더
    var medicineLeftColor : String // 약 색깔 - 왼쪽 - 블랜더
    var medicineRightColor : String // 약 색깔 - 오른쪽 - 블랜더
    var medicineTakingDate : Date // 약 복용 날짜
    var backgroundColor : String // 약 배경 색깔 - 블랜더
}

struct PainDetail {
    var id = UUID()
    var painPart : ArticulationList // 아픈 관절 부위
    var painPartNumber : FingerAndToesNum // 아픈 관절 번호
    var painPartAttendants : ArticulationDirection // 통증 좌우 위치
    var painDegree : PainDegree // 통증 정도
    var painDate : Date // 통증 기간
}

//
//  DateFormatCollect.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/27/24.
//

import Foundation
let Day = "yyyy-MM-dd"
let monthAndDay = "MM월 dd일"
let dayOfWeekFormatter = "EEEE"
let koreaLanguage = "ko_KR"

class DateFormatCollect{
    // 날짜를 문자열로 바꿔주기 위한 작업
    func DayForMatter(DayFormat : String) -> String{
        let DayFormatter = DateFormatter()
        if DayFormat == Day{
            DayFormatter.dateFormat = Day
            
        }
        else if DayFormat == monthAndDay{
            DayFormatter.dateFormat = monthAndDay
            DayFormatter.locale = Locale(identifier:koreaLanguage)
            
        }
        else if DayFormat == dayOfWeekFormatter{
            DayFormatter.dateFormat = "EEEE"
            DayFormatter.locale = Locale(identifier:koreaLanguage)
            
        }
        // 월 일 표시 포맷
        //    let monthAndDayFormatter = DateFormatter()
        // 요일 표시 포맷
        // 현재 날짜를 불러올 상수
        let today = Date()
        // 3년전 날짜 구하는 형식
        let threeYearsAgo = Calendar.current.date(byAdding:.year, value: -3, to: today)
        // let _ = print("\(threeYearsAgo!.description)")
        // 2달 뒤 날짜 구하는 형식
        let twoMonthAfter = Calendar.current.date(byAdding:.month, value: 2, to: today)
        // let _ = print("\(twoMonthAfter!.description)")
        // 비교하기 위해 시작 지점과 끝 지점 계산
        // 2021-04-18 06:51:12 +0000 3년전
        let beforeDate = DayFormatter.date(from: DayFormatter.string(from: threeYearsAgo!))
        // 2024-06-18 06:51:12 +0000 2달 뒤
        let afterDate = DayFormatter.date(from: DayFormatter.string(from: twoMonthAfter!))
        let interval = afterDate?.timeIntervalSince(beforeDate!)
        // 하루 기준으로 표시한 날짜 차이 - 배열의 크기가 되어야함
        let daysInterval = Int(interval! / 86400) // 1157
        // let _ = print(afterDate)
        // 변수 따로 만들어서 데이터를 갱신
        var currentDate = Calendar.current.date(byAdding: .year, value: -3, to: today)!
        // 제일 과거 날짜를 기준으로 하루씩 늘려가면서 배열에 추가
    }

}

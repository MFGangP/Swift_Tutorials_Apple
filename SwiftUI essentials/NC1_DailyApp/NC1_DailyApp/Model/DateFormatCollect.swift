//
//  DateFormatCollect.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/27/24.
//

import Foundation

let Day = "yyyy-MM-dd" // 일반 날짜 포맷
let monthAndDay = "MM월 dd일" // 월,일 표시 포맷
let dayOfWeekFormatter = "EEEE" // 요일 표시 포맷
let today = Date()

// 추후 언어 추가할 때 사용
enum languageList : String, CaseIterable{
    case koreaLanguage = "ko_KR" // 한글 표시 포맷
}

struct DateFormatController{
    let DayFormatter = DateFormatter()
    // 날짜를 문자열로 바꿔주기 위한 작업 문자열과 날짜 반환
    func DateController(DayFormat : String) -> String{
        //DateFormatter 설정
        // 기본 형식일 경우
        if DayFormat == Day{
            DayFormatter.dateFormat = Day
            
            return DayFormat
        }
        // 월, 일 일 경우
        else if DayFormat == monthAndDay{
            DayFormatter.dateFormat = monthAndDay
            DayFormatter.locale = Locale(identifier:languageList.koreaLanguage.rawValue)
            
            return DayFormat
        }
        // 요일 표시일 경우
        else if DayFormat == dayOfWeekFormatter{
            DayFormatter.dateFormat = dayOfWeekFormatter
            DayFormatter.locale = Locale(identifier:languageList.koreaLanguage.rawValue)
            
            return DayFormat
        }
        // 3년전 날짜 구하는 형식
        let threeYearsAgo = Calendar.current.date(byAdding:.year, value: -3, to: today)
        // let _ = print("\(threeYearsAgo!.description)")
        // 2달 뒤 날짜 구하는 형식
        let twoMonthAfter = Calendar.current.date(byAdding:.month, value: 2, to: today)
        // let _ = print("\(twoMonthAfter!.description)")
        // 비교하기 위해 시작 지점과 끝 지점 계산
        // 2021-04-18 06:51:12 +0000 3년전
       
        let interval = threeYearsAgo?.timeIntervalSince(twoMonthAfter!)
        // 하루 기준으로 표시한 날짜 차이 - 배열의 크기가 되어야함
        let daysInterval = Int(interval! / 86400) // 1157
        // let _ = print(afterDate)
        // 변수 따로 만들어서 데이터를 갱신
        var currentDate = Calendar.current.date(byAdding: .year, value: -3, to: today)!
        // 제일 과거 날짜를 기준으로 하루씩 늘려가면서 배열에 추가
        for _ in 0..<daysInterval {
            // Date 배열 저장
            DateSetArray.dateArray.append(currentDate)
            // let _ = print(DateSetArray.dateArray)
            // MM월dd 로 데이터 변환
            // let _ = print(DateSetArray.dayOfWeek)

            // 하루 씩 늘려가면서 날짜를 증가시킴
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
    }

}

               
}
//            // 날짜를 문자열로 바꿔주기 위한 작업
//            let DayFormatter = DateFormatter()
//            DayFormatter.dateFormat = "yyyy-MM-dd"
//            // 월 일 표시 포맷
//            let monthAndDayFormatter = DateFormatter()
//            monthAndDayFormatter.dateFormat = "MM월 dd일"
//            monthAndDayFormatter.locale = Locale(identifier:"ko_KR")
//            // 요일 표시 포맷
//            let dayOfWeekFormatter = DateFormatter()
//            dayOfWeekFormatter.dateFormat = "EEEE"
//            dayOfWeekFormatter.locale = Locale(identifier:"ko_KR")
//            //현재 날짜를 불러올 상수
//            let today = Date()
//            // 3년전 날짜 구하는 형식
//            let threeYearsAgo = Calendar.current.date(byAdding:.year, value: -3, to: today)
//            // let _ = print("\(threeYearsAgo!.description)")
//            // 2달 뒤 날짜 구하는 형식
//            let twoMonthAfter = Calendar.current.date(byAdding:.month, value: 2, to: today)
//            // let _ = print("\(twoMonthAfter!.description)")
//            // 비교하기 위해 시작 지점과 끝 지점 계산
//            // 2021-04-18 06:51:12 +0000 3년전
//            let beforeDate = DateFormatter(Day).date(from: DateFormatter(Day).string(from: threeYearsAgo!))
//            // 2024-06-18 06:51:12 +0000 2달 뒤
//            let afterDate = DateFormatter(Day).date(from: DateFormatter(Day).string(from: twoMonthAfter!))
//            let interval = afterDate?.timeIntervalSince(beforeDate!)
//            // 하루 기준으로 표시한 날짜 차이 - 배열의 크기가 되어야함
//            let daysInterval = Int(interval! / 86400) // 1157
//            // let _ = print(afterDate)
//            // 변수 따로 만들어서 데이터를 갱신
//            var currentDate = Calendar.current.date(byAdding: .year, value: -3, to: today)!
//            // 제일 과거 날짜를 기준으로 하루씩 늘려가면서 배열에 추가
//            for _ in 0..<daysInterval {
//                // Date 배열 저장
//                DateSetArray.dateArray.append(DateFormatter(Day).string(from: currentDate))
//                // let _ = print(DateSetArray.dateArray)
//                // MM월dd 로 데이터 변환
//                // let _ = print(DateSetArray.dayOfWeek)
//
//                // 하루 씩 늘려가면서 날짜를 증가시킴
//                currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
//            }
//            let _ = print("\(daysInterval)")
//            let _ = print("\(DateSetArray.dateArray)")
//            let _ = print("\(String(describing: threeYearsAgo))")
//            let _ = print("\(String(describing: twoMonthAfter))")

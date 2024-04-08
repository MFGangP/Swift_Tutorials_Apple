# Swift_Tutorials_Apple
스위프트 듀토리얼 애플 디벨로퍼

## 1일차(2024-03-29)
### [뷰 제작 및 합치기](https://github.com/MFGangP/Swift_Tutorials_Apple/tree/main/SwiftUI%20essentials/Introducing%20SwiftUI) : 애플 디벨로퍼 듀토리얼 1일차

- Creating and combining views (뷰 제작하고 합치기)

## 2일차(2024-03-30)
### [리스트 제작 및 탐색](https://github.com/MFGangP/Swift_Tutorials_Apple/tree/main/SwiftUI%20essentials/Introducing%20SwiftUI) : 애플 디벨로퍼 듀토리얼 2일차

- 1일차 파일에 이어서 학습
- Building lists and navigation (리스트 제작하고 탐색하기)

## 3일차(2024-03-31)
### [리스트 제작 및 탐색](https://github.com/MFGangP/Swift_Tutorials_Apple/tree/main/SwiftUI%20essentials/Introducing%20SwiftUI) : 애플 디벨로퍼 듀토리얼 3일차

- 2일차 파일에 이어서 학습 및 완료
- 네비게이션, 리스트, 구성요소 학습 (자주 써야 이해가 가능한 부분)
- \id: 를 왜 사용하는지 질문 할 예정
- Building lists and navigation (리스트 제작하고 탐색하기)

### [사용자 입력 처리](https://github.com/MFGangP/Swift_Tutorials_Apple/tree/main/SwiftUI%20essentials/Introducing%20SwiftUI) : 애플 디벨로퍼 듀토리얼 3일차

- 2일차 파일에 이어서 학습
- 변수 생성까지

## 4일차 (2024-04-01)
### [사용자 입력 처리](https://github.com/MFGangP/Swift_Tutorials_Apple/tree/main/SwiftUI%20essentials/Introducing%20SwiftUI) : 애플 디벨로퍼 듀토리얼 4일차

- 2일차 파일에 이어서 학습
- 토글, 애니메이션 추가
- environment(_:) modifier -> 이해 못했음

## 5일차 (2024-04-02)
### [스위프트 기본 학습 : The Swift Programming Language](https://bbiguduk.gitbook.io/swift/language-guide-1/the-basics) : 애플 디벨로퍼 듀토리얼 5일차

- 상수와 변수, 이름, 출력, 타입 명시
- 주석
- 세미콜론
- 정수, Int, UInt
- 타입 세이프티와 타입 추론
    - 코드를 컴파일 할 때 타입 검사를 수행하고 일치하지 않는 타입을 오류로 표시
- 숫자 리터럴
    - 접두사 없는 10진수
    - 0b : 접두사로 2진수
    - 0o : 접두사로 8진수
    - 0x : 접두사로 16진수

## 6일차 (2024-04-04)
### [스위프트 기본 학습 : The Swift Programming Language](https://bbiguduk.gitbook.io/swift/language-guide-1/the-basics) : 애플 디벨로퍼 듀토리얼 6일차

- 숫자 리터럴
    - 지수가 x 인 10진수는 기본 숫자에 10ˣ 가 곱해진다
        -1.25e2 는 1.25 x 10², 또는 125.0
        -1.25e-2 는 1.25 x 10⁻² , 또는 0.0125
    - 지수가 x 인 16진수는 기본 숫자에 2ˣ 가 곱해진다
        - 0xFp2 는 15 x 2² , 또는 60.0
        - 0xFp-2 는 15 x 2⁻² , 또는 3.75
- 정수 변환
    - 타입이 다른 두 상수끼리 더하고 싶을 때 초기화 해주면 더할 수 있다.
    - let twoThousand: UInt16 = 2_000
    - let one: UInt8 = 1
    - let twoThousandAndOne = twoThousand + UInt16(one)

- 정수와 부동 소수점 변환
    - 정수와 부동 소수점 숫자 타입의 변환은 명시적으로 하여야 함.
    
## 7일차 (2024-04-05)
### [스위프트 기본 학습 : The Swift Programming Language](https://bbiguduk.gitbook.io/swift/language-guide-1/the-basics) : 애플 디벨로퍼 듀토리얼 7일차

- 타입 별칭 = 특정 크기의 데이터로 작업, 상황에 맞는 이름으로 기존 타입 참조
- 부울(Booleans)
    - true, false
- 튜플(Tuple) = 여러 값을 단일 복합 값으로 그룹화
    - 인덱스를 사용하여 개별 요소 값 접근 가능
- 옵셔널(Optionals) = 값이 없는 경우, 2가지 가능성
    - 지정된 타입의 값이 있고 옵셔널을 풀어서 값에 접근하거나 값이 없을 수도 있음.
    - ?를 붙이면 옵셔널 선언 가능
- nil = 값이 없는 상태
    - 기본값 없이 옵셔널 변수 정의시 자동 nil
    - 옵셔널 아닌 상수와 변수에 사용 x
- 옵셔널 바인딩
    - 옵셔널이 값을 포함하는지 확인, 있는 경우 임시 상수 또는 변수로 사용가능하게 해줌
    
## 8일차 (2024-04-08)
### [사용자 입력 처리](https://github.com/MFGangP/Swift_Tutorials_Apple/tree/main/SwiftUI%20essentials/Introducing%20SwiftUI) : 애플 디벨로퍼 듀토리얼 8일차

- isFavorite 버튼 추가, modelData를 통한 상태 확인
- Swift 필수 사항 완료
- 배지 보기에 대한 그리기 데이터 만들기
- 대체값 제공 (Providing a Fallback Value)
    - 누락된 값을 처리하는 다른 방법은 nil-결합 연산자 (??) 사용하여 기본값을 제공하는 방법
    - 옵셔널에서 ?? 의 왼편이 nil 이 아니면, 값은 언래핑되고 사용됩니다. 그렇지 않으면 ?? 의 오른편에 값이 사용됩니다. 
    
``` swift
    let name: String? = nil
    let greeting = "Hello, " + (name ?? "friend") + "!"
    print(greeting)
    // Prints "Hello, friend!"
```

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
#### 기본(The Basics)
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
    - if문을 이용하여 옵셔널에 할당된 값을 임시 변수 또는 상수에 할당을 해주는 방식
    
## 8일차 (2024-04-08)
### [사용자 입력 처리](https://github.com/MFGangP/Swift_Tutorials_Apple/tree/main/SwiftUI%20essentials/Introducing%20SwiftUI) : 애플 디벨로퍼 듀토리얼 8일차

- isFavorite 버튼 추가, modelData를 통한 상태 확인
- Swift 필수 사항 완료
- 배지 View에 대한 그리기 데이터 만들기

### [스위프트 기본 학습 : The Swift Programming Language](https://bbiguduk.gitbook.io/swift/language-guide-1/the-basics) : 애플 디벨로퍼 듀토리얼 8일차

- 대체값 제공 (Providing a Fallback Value)
    - 누락된 값을 처리하는 다른 방법은 nil-결합 연산자 (??) 사용하여 기본값을 제공하는 방법
    - 옵셔널에서 ?? 의 왼편이 nil 이 아니면, 값은 언래핑되고 사용됩니다. 그렇지 않으면 ?? 의 오른편에 값이 사용됩니다. 
    ``` swift
        let name: String? = nil
        let greeting = "Hello, " + (name ?? "friend") + "!"
        print(greeting)
        // Prints "Hello, friend!"
    ```

- 강제 언래핑 (Force Unwrapping)
    - String과 String!는 같지 않기 때문에 동일시 할 수 없다.
    - 프로그래머의 에러 또는 원치않는 상태와 같은 실패를 nil 로 표현하려면 옵셔널의 이름 뒤에 느낌표 (!) 를 추가하여 접근할 수 있습니다. 이것을 옵셔널의 값의 강제 언래핑 (force unwrapping) 이라고 합니다. 
    ``` swift
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)

        let number = convertedNumber!

        guard let number = convertedNumber else {
            fatalError("The number was invalid")
        }
    ```
- 암시적으로 언래핑된 옵셔널 (Implicitly Unwrapped Optionals)
    - 일반 옵셔널과 동일하게 값의 부재를 나타낼 수 있다. (nil 혹은 값 할당이 가능하다)
    - 일반 옵셔널과 동일하게 옵셔널 언래핑 처리 과정을 거친 후에 값을 사용할 수도 있다.
    - 일반 옵셔널과는 다르게 옵셔널 언래핑 처리 과정을 거치지 않고도 값에 접근이 가능하다.
    - 만약 nil이 들어있는 암시적으로 언래핑한 옵셔널에 접근하면 runtime에 프로그램이 비정상적으로 종료된다.

- 에러 처리 (Error Handling)
    - 함수에 에러 조건이 되면 에러가 발생 합니다. 해당 함수의 호출자는 에러를 포착 하고 적절하게 응답할 수 있습니다.
    ```
        do {
            try canThrowAnError()
            // no error was thrown
        } catch {
            // an error was thrown
        }
    ```
    - 함수는 선언에 throws 키워드를 포함시켜 에러가 발생할 수 있음을 나타냅니다. 에러를 발생할 수 있는 함수를 호출할 때는 표현식 앞에 try 키워드를 붙여야 합니다.
- 역설과 전제조건 (Assertions and Preconditions)
    - 역설과 전제조건 (Assertions and preconditions) 은 런타임시 발생하는 조건입니다. 추가 코드를 실행하기 전에 이를 사용하여 필수조건이 충족되는지 확인할 수 있습니다. 
- 역설을 통한 디버깅 (Debugging with Assertions)
    - Swift 표준 라이브러리에 assert(_:_:file:line:) 함수로 역설을 작성할 수 있습니다. 이 함수에 true 또는 false 로 판단될 표현식과 조건이 false 일 경우 출력될 메세지를 전달합니다.
    ``` swift
    let age = -3
    assert(age >= 0, "A person's age can't be less than zero.")
    // This assertion fails because -3 is not >= 0.
    ```
- 강제 전제조건 (Enforcing Preconditions)
    - 조건이 거짓 일 가능성이 있을 때마다 전제조건을 사용하지만 코드가 순차적으로 실행되려면 확실하게 참이어야 합니다. 예를 들어 어떤 값들이 범위를 벗어나는지 또는 함수에 유효한 값이 전달되는지 체크하기위해 전제조건을 사용합니다.
    - precondition(_:_:file:line:) 함수로 전제조건을 작성할 수 있습니다. 이 함수에 true 또는 false 로 판단될 표현식과 조건이 false 일 경우 출력될 메세지를 전달합니다.
    ``` swift
    // In the implementation of a subscript...
    precondition(index > 0, "Index must be greater than zero.")
    ```

#### 기본 연산자 (Basic Operators)
- 술어 (Terminology)
    - 연산자는 단항 (unary), 이항 (binary), 또는 삼항 (ternary)입니다:
        - 단항 (Unary) 연산자는 -a 처럼 단일 항목에 동작합니다. 단항 접두사 연산자는 !b 처럼 항목 바로 직전에 위치하고 단항 접미사 연산자는 c! 처럼 항목 바로 다음에 위치합니다.
        - 이항 (Binary) 연산자는 2 + 3 처럼 2개의 항목에 동작하고 2개의 항목 사이에 위치해야 하므로 위치는 고정 입니다.
        - 삼항 (Ternary) 연산자는 3개의 항목에 동작합니다. C 처럼 Swift는 하나의 삼항 연산자만 있으며 삼항 조건 연산자 (a ? b : c)입니다.
    - 연산자가 영향을 주는 값은 피연산자 입니다. 1 + 2 표현식에서 + 기호는 중위 연산자 (infix operator)이고 값 1 과 2 는 피연산자 입니다.
- 대입 연산자 (Assignment Operator)
    -(a = b) 는 b 의 값으로 초기화 되거나 업데이트 됩니다.
    - 대입의 우항이 여러개의 값이 있는 튜플이라면 튜플의 요소는 여러개의 상수 또는 변수로 한번에 분해될 수 있습니다.
    ``` swift
        Copy
        let (x, y) = (1, 2)
        // x is equal to 1, and y is equal to 2
    ```
- 산술 연산자 (Arithmetic Operators)
    - 덧셈 (+), 뺄셈 (-), 곱셈 (*), 나눗셈 (/)
- 나머지 연산자 (Remainder Operator)
    - 나머지 연산자 (remainder operator) (a % b)는 a 안에 들어갈 b 의 배수가 몇인지를 계산하고 남은 값 (나머지)을 반환
- 단항 덧셈 연산자 (Unary Plus Operator)
- 복합 대입 연산자 (Compound Assignment Operators)
    - C처럼 Swift는 대입 (=)과 다른 연산자를 결합한 복합 대입 연산자 (compound assignment operators) 를 제공
- 비교 연산자 (Comparison Operators)
- 삼항 조건 연산자 (Ternary Conditional Operator)
    - 삼항 조건 연산자 (ternary conditional operator) 는 question ? answer1 : answer2 형태의 3가지 부분으로 이루어진 특별한 연산자
    - question 이 참이라면 answer1 을 반환하고 반대면 answer2 를 반환.
- Nil-결합 연산자 (Nil-Coalescing Operator)
    - (a ?? b)는 옵셔널 a에 값이 있으면 a를 풀거나 a가 nil 이면 기본값 b를 반환합니다. 표현식 a는 항상 옵셔널 타입 입니다. 표현식 b는 a에 저장된 타입과 같아야 합니다.
    ``` swift
        a != nil ? a! : b
    ``` 
#### 범위 연산자 (Range Operators)
- 닫힌 범위 연산자 (Closed Range Operator)
    
- 반-열림 범위 연산자 (Half-Open Range Operator)

## 9일차 (2024-04-09)
### 블렌더 기본
- 동전 만들기

### [스위프트 기본 학습 : First steps in Swift](https://www.hackingwithswift.com/100/swiftui) : 애플 디벨로퍼 듀토리얼 9일차
- 변수, 상수, 문자열 및 숫자, 부울, 문자열 보간 및 체크포인트 1

## 10일차 (2024-04-10)
### [스위프트 기본 학습 : First steps in Swift](https://www.hackingwithswift.com/100/swiftui) : 애플 디벨로퍼 듀토리얼 10일차
- 배열, 사전, 세트 및 열거형, type annotations, 주석 입력 및 체크포인트 2
- 은근 많이 봤던 형식의 코드라서 첨부
    ``` swift
        // Array 추가한 순서대로 다양한 값을 보유합니다. 이는 다음과 같이 전문화되어야 합니다 [String].
        var albums: [String] = ["Red", "Fearless"]
        // Dictionary데이터에 액세스하는 방법을 결정할 수 있는 다양한 값이 있습니다. 이는 다음과 같이 전문화되어야 합니다 [String: Int].
        var user: [String: String] = ["id": "@twostraws"]
        // Set다양한 값을 보유하지만 포함된 내용을 확인하는 데 최적화된 순서로 저장합니다. 이는 다음과 같이 전문화되어야 합니다 Set<String>.
        var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])
        // 초기 값을 제공하고 싶지 않은 경우 이러한 유형을 모두 아는 것이 중요합니다. 예를 들어, 다음은 문자열 배열을 생성합니다.
        var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
        // Swift는 문자열 배열을 할당하고 있음을 볼 수 있기 때문에 유형 주석이 필요하지 않습니다. 그러나 빈 문자열 배열을 생성하려면 다음 유형을 알아야 합니다.
        var teams: [String] = [String]()
        // 다시 말하지만, 유형 주석은 필수가 아니지만 문자열 배열이 작성되어 있음을 알아야 합니다 [String]. 빈 배열, 딕셔너리, 세트를 만들 때 여는 괄호와 닫는 괄호를 추가해야 한다는 점을 기억하세요. 왜냐하면 Swift에서 생성 방식을 사용자 정의할 수 있는 곳이기 때문입니다.
        // 어떤 사람들은 유형 주석을 선호하고 다음과 같이 빈 배열을 할당합니다.
        var cities: [String] = []
        // 나는 가능한 한 유형 추론을 사용하는 것을 선호하므로 다음과 같이 작성합니다.
        var clues = [String]()
    ```
## 11일차 (2024-04-11)
### NC1 Figma 작업 + 디자인 기초

## 12일차 (2024-04-12)
### Tech GA 수업 + NC1 Figma 작업

## 13일차 (2024-04-15)
### Austine GA 수업

- 

## 14일차 (2024-04-16)
### Leeo GA 수업

- @State, @Binding
    - 컴포넌트에 Binding 써야한다는 에러 고칠 때
    - 다른 화면에서 데이터를 같이 쓸 때
    - 화면이 업데이트 되었으면 할 때
    - 데이터의 흐름을 만들 때 State -> Binding
        
- State란
    - Struct로 인스턴스를 만들면 고칠 수가 없다
    - Class로 인스턴스를 만들면 수정된다.
    - SwiftUI는 한번 그릴 때마다 다시 그려줘야된다.
    - State가 바뀌면 화면이 다시 그려지게 끔 해주는 원리
    
- Data
    - 배워서 어디다 쓸까?
    - 반복되는 데이터의 형태 만들기
    - 내가 가지고 있는 데이터에 이름 붙이기
    - 내가 가지고 있는 데이터 정리하기
        
- Data persistence
    - 배워서 어디다 쓸까?
    - Coredata, Swiftdata, file I/O의 차이를 이해하기 UserDefault 등등
    - 데이터를 저장하는데 필요한 기본지식 알기
    - 데이터를 저장하고 불러오는 방법 알기
    - Create, Read, Update, Delete
    
## 15일차 (2024-04-17)
### NC1 App 개발

- ToDo
    - 캘린더 커스텀 하기
    - 데이터 입출력
    - 모달 창 사용하기
    - 기록 가져와서 표시하기

# Swift_Tutorials_Apple
스위프트 듀토리얼 애플 디벨로퍼

## 섹션 1 
### 새 프로젝트 만들기 및 캔버스 탐색

## 섹션 2
### 텍스트 보기 사용자 정의
- 캔버스 모드 사용법
- Command-Control-클릭으로 팝 오버 표시 가능
    - 다양한 설정을 마우스로 변경 가능
    
## 섹션 3
### 스택을 사용하여 뷰 결합
- 텍스트 뷰에서도 Control-클릭을 사용하여 컨텍스트 메뉴 사용 가능
    - 메뉴를 통해 스택 등 다양한 기능 추가 가능
    <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec3_Text.png?raw=true">
## 섹션 4
### 사용자 정의 이미지 보기 만들기
- .clipShape(Circle())을 사용하면 사진이 동그랗게 잘라진다.
    - 마스크로 사용하거나 원에 획이나 채우기를 제공하여 뷰로 사용할 수 있음 
        <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec4_Image.png?raw=true">
    - 그러나 이미지에 따라 배율이라던지 전체적으로 문제가 있음. 살펴봐야 할 듯.
        <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec4_ImageAsset.png?raw=true">
- .overlay
- Circle().stroke(.gray, lineWidth: 4)를 사용하여 테두리를 설정해 줄 수 있다.
- Image("").shadow(radius:)를 사용하면 그림자를 줄 수 있다.

## 섹션 5
### 다른 프레임워크의 SwiftUI 뷰 사용
- MapKit을 import해서 지도 기능을 사용할 수 있다.
- 예제를 따라했는데 지도 위치가 표시가 안되는 상황이 발생해서 수정해야함.
    <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec5_MapErr.png?raw=true">
    - 안되는게 아니고 캔버스 모드를 계속 키고 있어서 안되는거 였다.
    <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec5_Success.png?raw=true">

## 섹션 6
### 세부 View 작성하기

- 스텍, 텍스트, 이미지, 지도를 전부 종합해서 하나의 페이지로 제작
<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec6_Image.png?raw=true">

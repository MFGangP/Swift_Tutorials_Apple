# Introducing SwiftUI

## 뷰 제작하고 합치기
스위프트 듀토리얼 애플 디벨로퍼

### 섹션 1 
#### 새 프로젝트 만들기 및 캔버스 탐색

### 섹션 2
#### 텍스트 보기 사용자 정의
- 캔버스 모드 사용법
- Command-Control-클릭으로 팝 오버 표시 가능
    - 다양한 설정을 마우스로 변경 가능
    
### 섹션 3
#### 스택을 사용하여 뷰 결합
- 텍스트 뷰에서도 Control-클릭을 사용하여 컨텍스트 메뉴 사용 가능
    - 메뉴를 통해 스택 등 다양한 기능 추가 가능
    <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec3_Text.png?raw=true" width="640" height="360">
    
### 섹션 4
#### 사용자 정의 이미지 보기 만들기
- .clipShape(Circle())을 사용하면 사진이 동그랗게 잘라진다.
    - 마스크로 사용하거나 원에 획이나 채우기를 제공하여 뷰로 사용할 수 있음 
        <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec4_Image.png?raw=true" width="640" height="360"/>
    - 그러나 이미지에 따라 배율이라던지 전체적으로 문제가 있음. 살펴봐야 할 듯.
        <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec4_ImageAsset.png?raw=true" width="640" height="360"/>
- .overlay
- Circle().stroke(.gray, lineWidth: 4)를 사용하여 테두리를 설정해 줄 수 있다.
- Image("").shadow(radius:)를 사용하면 그림자를 줄 수 있다.

### 섹션 5
#### 다른 프레임워크의 SwiftUI 뷰 사용
- MapKit을 import해서 지도 기능을 사용할 수 있다.
- 예제를 따라했는데 지도 위치가 표시가 안되는 상황이 발생해서 수정해야함.
    <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec5_MapErr.png?raw=true" width="640" height="360"/>
    - 안되는게 아니고 캔버스 모드를 계속 키고 있어서 안되는거 였다.
    <img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec5_Success.png?raw=true" width="640" height="360"/>

### 섹션 6
#### 세부 View 작성하기

- 스텍, 텍스트, 이미지, 지도를 전부 종합해서 하나의 페이지로 제작
<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/Sec6_image.png?raw=true" width="640" height="360"/>

## 리스트 생성 및 탐색

### 섹션 1
#### 목록 및 탐색 작성

- 모델 만들기 - 데이터 저장 모델

### 섹션 2
#### 행 뷰 만들기

- 행 뷰 만들기
<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/List_Sec2.png?raw=true" width="640" height="360"/>

### 섹션 3
#### 행 미리보기 사용자 정의

- 캔버스 레이블 나누기
    - 캔버스 레이블을 나눠서 한 화면에서 두가지 이상의 프리뷰를 볼 수 있다.
<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/List_Sec3_Lable.png?raw=true" width="640" height="360"/>

- 미리보기 그룹화
    - 아직 어디 쓰는지는 이해하지 못함
<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/List_Sec3_Preview.png?raw=true" width="640" height="360"/>

### 섹션 4
#### Landmark 리스트 만들기

- 프리뷰 뿐만 아니라 리스트 내에서 정의해도 가능하다.
- 미리보기에서 IOS에 적합한 리스트 스타일로 렌더링되어 표시가 된다.
<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/List_Sec4_List.png?raw=true" width="640" height="360"/>

### 섹션 5
#### 리스트를 동적으로 만들기

- 리스트 문을 통해 랜드마크 호출

### 섹션 6
#### 리스트와 네비게이션

- 동적으로 생성된 랜드마크 목록을 네비게이션에 연결해 줌
- 뒤로가기 버튼이 생기는 .navigationTitle()

<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/List_Sec6_Navi.png?raw=true" width="640" height="360"/>

### 섹션 7
#### 하위 뷰에 데이터 전달

- 스크롤 뷰
- 데이터 바인딩
- 사용자 정의 뷰

<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/List_Sec7_Navi.png?raw=true" width="640" height="360"/>

### 섹션 8
#### 장비 별 미리보기 동적 생성 

- 오른쪽 미리보기에서 장비 종류를 바꾸면 자동으로 변경
- 다크, 라이트, 가로, 세로 모드도 설정 가능함

<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/List_Sec8_List.png?raw=true" width="640" height="360"/>

## 사용자 입력 처리

### 섹션 1
#### 랜드마크 좋아요 표시 처리

- 변수 isFavorite 선언으로 좋아요 표시하기

<img src = "https://github.com/MFGangP/Swift_Tutorials_Apple/blob/main/Image/User_Sec1.png?raw=true" width="640" height="360"/>

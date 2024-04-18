//
//  ContentView.swift
//  NC1_DailyApp
//
//  Created by lovehyun95 on 4/13/24.
//
//class ContentViewModel: ObservableObject {
//    @Published var name: String =  ""
//
//    func onTabSubmitButton() {
//        // logic
//    }
//}
//    @State var name = ""
//    @ObservedObject var contentViewModel = ContentViewModel()
//    @State var selectedMedicine: MedicineEnumType = .tablet
//    Text(contentViewModel.name)

import SwiftUI

struct MedicineDaily : View {
    // 임시 데이터로 Medicine 배열 생성
    @State var medicines: [Medicine] = [
            //painDetail: [
//            PainDetail(painPart: "손목",
//                            painPartNumber: 1,
//                            painPartAttendants: "왼쪽",
//                            painDegree: 5,
//                            painDate: Date()),
//     ]),
        Medicine(Index : 0 ,date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 1",
                                                    medicineType: .tablet,
                                                    medicineVolume: 1,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 8,
                                                    administrationTime: Date(),
                                                    medicineShape: "Round",
                                                    medicineLeftColor: "Blue",
                                                    medicineRightColor: "Red",
                                                    medicineTakingDate : Date()-1,
                                                    backgroundColor: "White")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.wrist,
                                   painPartNumber: FingerAndToesNum.first,
                                   painPartAttendants: ArticulationDirection.left,
                                   painDegree: PainDegree.two,
                                            painDate: Date()-1)]),
            Medicine(Index : 1 ,date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 2",
                                                    medicineType: .capsule,
                                                    medicineVolume: 2,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 12,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-2,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.second,
                                            painPartAttendants: ArticulationDirection.right,
                                            painDegree: PainDegree.three,
                                            painDate: Date()-2)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-3,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-3)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-4,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-4)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-5,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-5)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-6,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-6)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-7,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-7)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-8,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-8)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-9,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-9)]),
            Medicine(date: Date(),
                     medicineDetail: [
                        MedicineDetail(medicineName: "Medicine 3",
                                                    medicineType: .capsule,
                                                    medicineVolume: 3,
                                                    medicineUnit: .gram,
                                                    medicineFrequency: 1,
                                                    administrationTime: Date(),
                                                    medicineShape: "Oval",
                                                    medicineLeftColor: "Yellow",
                                                    medicineRightColor: "Green",
                                                    medicineTakingDate : Date()-10,
                                                    backgroundColor: "Gray")],
                     painDetail: [
                        PainDetail(painPart: ArticulationList.finger,
                                            painPartNumber: FingerAndToesNum.third,
                                            painPartAttendants: ArticulationDirection.left,
                                            painDegree: PainDegree.one,
                                            painDate: Date()-10)]),
        ]// 배열 끝

    // 현재 탭 번호
    @State var currentTab: Int = 0
    // 현재 날짜를 불러올 상수

    var body: some View {
        // Z 스텍으로 뷰 위에 띄운다.
        ZStack(alignment: .top) {
            // 탭뷰는 현재 탭 번호를 받는다.
            TabView(selection: self.$currentTab) {
                View1(medicines: $medicines).tag(0)
                View2(medicines: $medicines).tag(1)
            }
            // 탭뷰 스타일 .naver는 아래 탭 위치를 안보여주고 .always 는 보여준다.
            .tabViewStyle(.page(indexDisplayMode: .always))
            // SafeArea 없이 전부 쓰거나 여유를 주고 싶을 때
            .edgesIgnoringSafeArea(.all)
            TabBarView(currentTab: self.$currentTab)
        }
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    // 탭 제목으로 설정할 String 형태의 배열
    var tabBarOptions: [String] = ["통증 기록", "투약 기록"]
    var body: some View {
        
        // 좌우로 넘기기 위한 스크롤 뷰
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 80) {
                // 왼쪽 여백
                Spacer()
                // zip 함수를 사용하여 tabBarOptions 배열의 인덱스와 요소를 묶어 튜플의 배열을 생성합니다. 이렇게 함으로써 각 요소와 해당하는 인덱스를 함께 사용할 수 있다.
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        // 여기서는 튜플의 첫 번째 요소를 고유 식별자로 사용.
                        id: \.0,
                        // 순회하면서 각 요소와 해당하는 인덱스에 대해 실행할 내용을 클로저로 정의. index는 인덱스를, name은 배열의 요소를 나타냄.
                        content: {
                    index, name in
                    // TabBarItem 뷰를 생성. 각 탭에 대한 정보를 전달하기 위해 currentTab, namespace, tabBarItemName, tab 등의 매개변수를 전달. currentTab은 현재 선택된 탭을 나타내는 변수이며, namespace는 네임스페이스를, tabBarItemName은 탭의 이름을, tab은 탭의 인덱스를 전달.
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                })
                // 오른쪽 여백
                Spacer()
            }
            .padding(.horizontal)
        }
        // 배경은 하얀색으로
        .background(Color.white)
        // 위쪽 여백
        .frame(height: 90)
        // SafeArea 없이 전부 쓰거나 여유를 주고 싶을 때
        .edgesIgnoringSafeArea(.all)
    }

}
struct TabBarItem: View {
    // 현재 선택된 탭의 인덱스를 나타내는 currentTab 변수를 바인딩으로 선언. 이렇게 하면 부모 뷰에서 해당 변수를 업데이트할 수 있다.
    @Binding var currentTab: Int
    // 애니메이션에 사용되는 네임스페이스의 ID를 나타냄. 이 네임스페이스는 matchedGeometryEffect에 사용됌.
    let namespace: Namespace.ID
    // 탭 바 아이템의 이름을 나타냄.
    var tabBarItemName: String
    // 탭의 인덱스를 나타냄.
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                    .frame(minHeight: 60, maxHeight: 60)
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black
                        .frame(height: 2)
                    // 선택된 탭의 경우 밑줄의 애니메이션을 제공하기 위해 사용. 선택된 탭의 밑줄이 움직이면서 나타나도록 만들어준다. 이때, id와 in은 각각 유일한 식별자와 네임스페이스를 나타낸다. .properties는 애니메이션 효과가 적용되는 속성을 지정.
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            // 애니메이션 효과를 적용. 여기서는 탭이 변경될 때 스프링 애니메이션 효과를 적용하도록 설정되어 있다.
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineDaily()
    }
}
// lazy 변수는 처음 사용되기 전까지는 연산이 되지 않는다

#Preview {
    MedicineDaily()
}

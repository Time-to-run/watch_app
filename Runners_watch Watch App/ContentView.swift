import SwiftUI

struct ContentView: View {
    @State private var showStartView = false // 화면 전환 상태 관리
    @State private var navigateToCountsView = false

    var body: some View {
        ZStack {
            VStack {
                // Assets에 저장된 이미지 사용
                Image("메인 이미지") // "메인 이미지"는 Assets에 추가된 이미지 이름
                    .resizable() // 크기 조정을 허용
                    .frame(width: 170, height: 230) // 원하는 크기 지정
                    .cornerRadius(15)
            }
            .onTapGesture {
                // 화면을 터치하면 StartView로 전환
                showStartView = true
            }
        }
        // StartView로 전환
        .fullScreenCover(isPresented: $showStartView) {
            StartView() // 다른 파일에 있는 StartView
        }
    }
}

#Preview {
    ContentView()
}




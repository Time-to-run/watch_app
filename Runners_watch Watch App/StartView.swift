import SwiftUI

struct StartView: View {
    @State private var navigateToStopAndRunView = false // 화면 전환 상태 관리

    var body: some View {
        ZStack {
            // 배경색: 검정
            Color.black
                .ignoresSafeArea() // 전체 화면을 검정으로 채움
            
            // 주황색 원
            Circle()
                .fill(Color("AccentColor")) // 원의 색상
                .frame(width: 130, height: 130) // 원 크기
            
            // 흰색 "Start" 텍스트 버튼
            Text("Start")
                .font(.system(size: 40, weight: .bold, design: .default)) // 텍스트 크기 50, 두껍게
                .foregroundColor(.white) // 텍스트 색상
                .padding(20) // 텍스트 주변 패딩
                .background(Color.white.opacity(0.0)) // 버튼 영역 배경 (투명)
                .clipShape(Circle()) // 텍스트 클릭 영역을 원으로
                .onTapGesture {
                    // 버튼을 누르면 화면 전환 상태를 true로 변경
                    navigateToStopAndRunView = true
                }
        }
        // StopandRunView로 화면 전환
        .fullScreenCover(isPresented: $navigateToStopAndRunView) {
            StopandRunView() // StopandRunView로 전환
        }
    }
}

#Preview {
    StartView()
}


import SwiftUI

struct RunningResultView: View {
    @State private var navigateToStartView = false // StartView로 전환 상태 관리

    @State private var distance: String = "3.24" // 총 러닝 거리
    @State private var runningTime: String = "00:15:42" // 러닝 시간
    @State private var heartRate: Int = 145 // 평균 심박수

    var body: some View {
        VStack(spacing: 15) { // 세로 정렬 및 간격
            // 러닝 결과 제목
            Text("러닝 결과")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 10)

            // 러닝 데이터 표시
            VStack(alignment: .leading, spacing: 10) { // 좌측 정렬
                Text("뛴 거리: \(distance) km")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                
                Text("러닝시간: \(runningTime)")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.white)
                
                Text("평균 심박수: \(heartRate)")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 5)

            Spacer() // 아래로 여백

            // 메인 화면으로 돌아가기 버튼
            Button(action: {
                navigateToStartView = true // StartView로 전환
            }) {
                Text("")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("AccentColor"))
                    .cornerRadius(10)
                    .padding(.horizontal, 5)
            }
        }
        .padding()
        .background(Color.black) // 전체 배경색
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $navigateToStartView) {
            StartView() // StartView로 전환
        }
    }
}

#Preview {
    RunningResultView()
}


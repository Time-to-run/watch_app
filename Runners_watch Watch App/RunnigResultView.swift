import SwiftUI

struct RunningResultView: View {
    @State private var navigateToCountsView = false // ContentView로 전환 상태 관리

    let distance: String // 총 러닝 거리
    let runningTime: String // 러닝 시간
    
    @State private var heartRate: Int = 145 // 평균 심박수

    var body: some View {
        VStack(spacing: 15) { // 세로 정렬 및 간격
            // 러닝 결과 제목
            Text("러닝 결과")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 20)

            // 러닝 데이터 표시
            VStack(alignment: .leading, spacing: 17) { // 좌측 정렬
                HStack {
                    Text("러닝 거리:")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.white) // 텍스트 색상 흰색
                    Text("\(distance) km")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color("AccentColor")) // 숫자 색상 그대로 유지
                }
                
                HStack {
                    Text("러닝시간:")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.white) // 텍스트 색상 흰색
                    Text("\(runningTime)")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color("AccentColor")) // 숫자 색상 그대로 유지
                }
                
                HStack {
                    Text("평균심박수:")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.white) // 텍스트 색상 흰색
                    Text("\(heartRate)BPM")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color("AccentColor")) // 숫자 색상 그대로 유지
                }
            }

        }
        .padding()
        .ignoresSafeArea()
        .onTapGesture {
            navigateToCountsView = true
        }
        .fullScreenCover(isPresented: $navigateToCountsView) {
            ContentView()
        }
    
    }
}

#Preview {
    RunningResultView(distance: "0.54", runningTime: "0:00:42")
}


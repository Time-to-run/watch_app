import SwiftUI

struct RunningResultView: View {
    // 결과 데이터를 저장하는 변수
    @State private var distance: String = "3.24" // 총 러닝 거리 (예: 3.24km)
    @State private var runningTime: String = "00:15:42" // 러닝 시간 (예: 48분 15초)
    @State private var heartRate: Int = 145 // 평균 심박수 (예: 145 BPM)

    var body: some View {
        VStack(spacing: 30) { // 세로 정렬 및 간격
            // 러닝 결과 제목
            Text("러닝 결과")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 20)

            // 러닝 데이터 표시
            VStack(spacing: 15) { // 세부 정보 간 간격
                ResultItem(label: "키로미터", value: "\(distance) km")
                ResultItem(label: "러닝 시간", value: runningTime)
                ResultItem(label: "평균 심박수", value: "\(heartRate) BPM")
            }

            Spacer() // 아래로 여백

            // 메인 화면으로 돌아가기 버튼
            Button(action: {
                print("메인 화면으로 이동")
            }) {
                Text("메인 화면으로")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("AccentColor"))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
        }
        .padding()
        .background(Color.black) // 전체 배경색
        .ignoresSafeArea()
    }
}

// 결과 데이터 아이템을 위한 뷰
struct ResultItem: View {
    let label: String // 항목 이름
    let value: String // 값

    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.gray)
                .frame(width: 120, alignment: .leading) // 일정한 넓이 확보
            Spacer()
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    RunningResultView()
}


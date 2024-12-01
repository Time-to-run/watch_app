
import SwiftUI

struct StopandRunView: View {
    @State private var distance: String = "3:42" // 거리 데이터
    @State private var runningTime: TimeInterval = 0 // 뛴 시간 (초 단위)
    @State private var timer: Timer? = nil // 타이머 객체
    @State private var isRunning: Bool = true // 기본적으로 재생 상태
    

    private let timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    var body: some View {
        VStack {
            // 상단에 달린 시간 표시
            Text("Time: \(timeFormatter.string(from: runningTime) ?? "00:00:00")")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding(.top, 10)
                .padding()

            Text(distance)
                .font(.system(size: 55))
                .foregroundColor(Color("AccentColor"))
                .padding(.top, -10)

            Text("Km")
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.gray)

            Spacer()

            // 하단에 버튼들
            HStack {
                // 왼쪽 원 (초기화 버튼)
                ZStack {
                    Circle()
                        .fill(Color("AccentColor"))
                        .frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                }
                .onTapGesture {
                    resetValues()
                }

                Spacer()

                // 오른쪽 원 (재생/멈춤 버튼)
                ZStack {
                    Circle()
                        .fill(Color("AccentColor"))
                        .frame(width: 50, height: 50)

                    if isRunning {
                        // 멈춤 버튼
                        HStack(spacing: 5) {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 10, height: 25)
                                .cornerRadius(3)
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 10, height: 25)
                                .cornerRadius(3)
                        }
                    } else {
                        // 재생 버튼
                        Triangle()
                            .fill(Color.white)
                            .frame(width: 25, height: 25)
                    }
                }
                .onTapGesture {
                    toggleRunState()
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, -15)
        }
        .background(Color.black)
        .ignoresSafeArea()
        .onAppear {
            startTimer() // 화면이 나타날 때 타이머 시작
        }
    }

    // 타이머 시작
    func startTimer() {
        timer?.invalidate() // 기존 타이머 종료
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            runningTime += 1
        }
    }

    // 타이머 상태 토글
    func toggleRunState() {
        if isRunning {
            // 멈춤
            timer?.invalidate()
            timer = nil
        } else {
            // 재생
            startTimer()
        }
        isRunning.toggle()
    }

    // 초기화
    func resetValues() {
        timer?.invalidate()
        timer = nil
        isRunning = false
        runningTime = 0
        distance = "0:00"
        print("초기화 완료")
    }
}

// 커스텀 삼각형 도형
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: height / 2))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.closeSubpath()
        }
    }
}


#Preview {
    StopandRunView()
}

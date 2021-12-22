import Foundation

final class PorkerTimerViewModel: ObservableObject {
    func startTimer() {
        let countDownItr = CountDownTimerInteractor(countDownTime: 10)
        countDownItr.execute { remainingTime in
            print("残り時間: \(remainingTime)")
        }
    }
}

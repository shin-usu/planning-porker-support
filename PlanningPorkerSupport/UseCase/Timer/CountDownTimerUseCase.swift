import Foundation

protocol CountDownTimerUseCase {
    func execute(handler: @escaping (Int) -> Void)
    func reset()
}

final class CountDownTimerInteractor: CountDownTimerUseCase {
    private let countDownTime: Int // カウントダウンを行う時間
    private var remainingTime: Int // 残り時間
    private var timer: Timer?

    init(countDownTime: Int) {
        self.countDownTime = countDownTime
        self.remainingTime = countDownTime
    }

    /// 1秒ごとにhandlerが実行される
    /// 残り時間が0になった段階で処理は停止する
    func execute(handler: @escaping (Int) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] time in
            guard let self = self else { return }
            self.remainingTime -= 1
            if self.remainingTime == 0 {
                time.invalidate()
            }
            handler(self.remainingTime)
        }
    }

    /// 初期値に変更する
    func reset() {
        remainingTime = countDownTime
    }
}

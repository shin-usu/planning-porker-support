import Foundation
import AudioToolbox

final class PorkerTimerPresenter: ObservableObject {
    @Published var countDownTime: Int = 10
    @Published var timerState: TimerState = .initial

    let router: PorkerTimerWireframe
    private let countDownItr: CountDownTimerUseCase
    private let systemSoundItr: SystemSoundUseCase

    enum TimerState {
        case initial
        case executing
        case stop
    }

    init (
        router: PorkerTimerWireframe = PorkerTimerRouter(),
        systemSoundItr: SystemSoundUseCase = SystemSoundInteractor(),
        countDownItr: CountDownTimerUseCase = CountDownTimerInteractor(countDownTime: 10)
    ) {
        self.router = router
        self.systemSoundItr = systemSoundItr
        self.countDownItr = countDownItr
    }

    func startTimer() {
        DispatchQueue.main.async { [weak self] in
            self?.timerState = .executing
        }
        countDownItr.execute { [weak self] remainingTime in
            self?.countDownTime = remainingTime
            if remainingTime == 0 {
                self?.systemSoundItr.playSound()
            }
        }
    }

    func stopTimer() {
        DispatchQueue.main.async { [weak self] in
            self?.timerState = .stop
        }
        countDownItr.stop()
        systemSoundItr.stop()
    }

    func reset() {
        DispatchQueue.main.async { [weak self] in
            self?.timerState = .initial
            self?.countDownTime = 10
        }
        countDownItr.reset()
    }
}

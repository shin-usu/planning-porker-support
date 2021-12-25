import Foundation
import AudioToolbox

final class PorkerTimerViewModel: ObservableObject {
    @Published var countDownTime: Int = 10
    @Published var timerState: TimerState = .initial

    private let countDownItr: CountDownTimerUseCase
    private let systemSoundItr: SystemSoundUseCase

    enum TimerState {
        case initial
        case executing
        case stop
    }

    init () {
        let systemSoundRepo = SystemSoundRepositoryImpl(systemSoundId: 1109)
        self.systemSoundItr = SystemSoundInteractor(repo: systemSoundRepo)
        self.countDownItr = CountDownTimerInteractor(countDownTime: 10)
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
    
    func stop() {
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

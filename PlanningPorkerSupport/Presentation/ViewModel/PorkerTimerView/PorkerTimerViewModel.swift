import Foundation
import AudioToolbox

final class PorkerTimerViewModel: ObservableObject {
    private let countDownItr: CountDownTimerUseCase
    private let systemSoundItr: SystemSoundUseCase

    init () {
        let systemSoundRepo = SystemSoundRepositoryImpl(systemSoundId: 1109)
        self.systemSoundItr = SystemSoundInteractor(repo: systemSoundRepo)
        self.countDownItr = CountDownTimerInteractor(countDownTime: 10)
    }

    func startTimer() {
        countDownItr.execute { [weak self] remainingTime in
            print("残り時間: \(remainingTime)")
            if remainingTime == 7 {
                self?.systemSoundItr.playSound()
            }
            if remainingTime == 0 {
                self?.systemSoundItr.stop()
            }
        }
    }
}

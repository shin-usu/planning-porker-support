import Foundation
import AudioToolbox

protocol SystemSoundUseCase {
    func playSound()
    func stop()
}

final class SystemSoundInteractor: SystemSoundUseCase {
    private let repo: SystemSoundRepository

    init(repo: SystemSoundRepository) {
        self.repo = repo
    }

    func playSound() {
        repo.playSound()
    }
    
    func stop() {
        repo.stop()
    }
}

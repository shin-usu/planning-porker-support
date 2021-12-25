import Foundation
import AudioToolbox

protocol SystemSoundRepository {
    func playSound()
    func stop()
}

final class SystemSoundRepositoryImpl: SystemSoundRepository {
    private let systemSoundId: SystemSoundID

    init(systemSoundId: SystemSoundID = 1008) {
        self.systemSoundId = systemSoundId
    }

    func playSound() {
        guard let soundUrl = CFBundleCopyResourceURL(CFBundleGetMainBundle(), nil, nil, nil) else {
            print("Error: CFBundleCopyResourceURL is nil")
            return
        }
        var systemSoundId = systemSoundId
        AudioServicesCreateSystemSoundID(soundUrl, &systemSoundId)
        AudioServicesPlaySystemSound(systemSoundId)
        AudioServicesAddSystemSoundCompletion(systemSoundId, nil, nil, { id, _ in
            AudioServicesPlaySystemSound(id)
        }, nil)
    }

    func stop() {
        AudioServicesRemoveSystemSoundCompletion(systemSoundId)
    }
}

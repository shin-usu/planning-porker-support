import SwiftUI

protocol PorkerTimerWireframe {
    func showTimerSettingView<Label: View>(
        @ViewBuilder label: () -> Label
    ) -> NavigationLink<Label, TimerSettingView>
}

struct PorkerTimerRouter: PorkerTimerWireframe {
    func showTimerSettingView<Label: View>(
        @ViewBuilder label: () -> Label
    ) -> NavigationLink<Label, TimerSettingView> {
        return NavigationLink(destination: TimerSettingView(), label: label)
    }
}

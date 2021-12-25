import SwiftUI

struct PorkerTimerView: View {
    @StateObject var vm: PorkerTimerViewModel
    var body: some View {
        VStack(spacing: 0) {
            Text("\(vm.countDownTime)秒")
                .font(.system(size: 40))
                .padding(.bottom, 24)

            if (vm.timerState == .initial || vm.timerState == .stop), vm.countDownTime != 0 {
                SimpleButton(
                    text: "Start",
                    width: UIScreen.main.bounds.width - 64,
                    action: vm.startTimer
                )
                    .padding(.bottom, 24)
            }

            if vm.timerState == .executing {
                SimpleButton(
                    text: "Stop",
                    backgroundColor: .red,
                    width: UIScreen.main.bounds.width - 64,
                    action: vm.stop
                )
                    .padding(.bottom, 24)
            }
            
            if vm.timerState == .stop {
                SimpleButton(
                    text: "Reset",
                    backgroundColor: .gray,
                    width: UIScreen.main.bounds.width - 64,
                    action: vm.reset
                )
                    .padding(.bottom, 24)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 64)
    }
}

struct PorkerTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PorkerTimerView(vm: .init())
    }
}

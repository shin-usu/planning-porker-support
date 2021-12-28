import SwiftUI

struct PorkerTimerView: View {
    @StateObject private var presenter: PorkerTimerPresenter = PorkerTimerPresenter()

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    presenter.router.showTimerSettingView {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 16)
                Spacer()
            }
            VStack(spacing: 0) {
                Text("\(presenter.countDownTime)秒")
                    .font(.system(size: 40))
                    .padding(.bottom, 24)

                if (presenter.timerState == .initial || presenter.timerState == .stop), presenter.countDownTime != 0 {
                    SimpleButton(
                        text: "Start",
                        width: UIScreen.main.bounds.width - 64,
                        action: presenter.startTimer
                    )
                        .padding(.bottom, 24)
                }

                if presenter.timerState == .executing {
                    SimpleButton(
                        text: "Stop",
                        backgroundColor: .red,
                        width: UIScreen.main.bounds.width - 64,
                        action: presenter.stopTimer
                    )
                        .padding(.bottom, 24)
                }
                
                if presenter.timerState == .stop {
                    SimpleButton(
                        text: "Reset",
                        backgroundColor: .gray,
                        width: UIScreen.main.bounds.width - 64,
                        action: presenter.reset
                    )
                        .padding(.bottom, 24)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 64)
        }
    }
}

struct PorkerTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PorkerTimerView()
    }
}

import SwiftUI

struct PorkerTimerView: View {
    @StateObject var vm: PorkerTimerViewModel
    var body: some View {
        Text("タイマー!")
            .onAppear {
                vm.startTimer()
            }
    }
}

struct PorkerTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PorkerTimerView(vm: .init())
    }
}

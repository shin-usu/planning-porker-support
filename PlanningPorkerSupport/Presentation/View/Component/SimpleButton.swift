import SwiftUI

struct SimpleButton: View {
    let text: String
    let textColor: Color
    let backgroundColor: Color
    let width: CGFloat?
    let height: CGFloat?
    let action: () -> Void

    init(
        text: String,
        textColor: Color = .white,
        backgroundColor: Color = .accentColor,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            VStack {
                Text(text)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(width: width, height: height)
            .background(backgroundColor)
            .cornerRadius(8)
        }
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton(text: "Hello", action: {})
    }
}

import SwiftUI

struct color_preview: View {
    @State var text: String
    @Binding var color: Color
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Circle()
                .foregroundColor(color)
                .frame(width: 30, height: 30)
        }
    }
}

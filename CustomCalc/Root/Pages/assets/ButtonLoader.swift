import SwiftUI

struct ButtonLoader: View {
    @Binding var height_calc_button: CGFloat
    @Binding var width_calc_button: CGFloat
    @Binding var round_btn: CGFloat
    @Binding var selcolor4: Color
    @Binding var shadow_opacity_1: CGFloat
    @Binding var shadow_pos_x: CGFloat
    @Binding var shadow_pos_y: CGFloat
    @Binding var shadow1: CGFloat
    @Binding var color_border: Color
    @Binding var rotate_btn: CGFloat
    @Binding var width_border: CGFloat
    @Binding var selcolor: Color
    @Binding var selcolor2: Color
    @Binding var selectedEmoji: String
    @Binding var font_size2_1: CGFloat
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    @State var symbol: String
    @Binding var font_size: CGFloat
    @Binding var fontName: String
    @Binding var round_btn12: CGFloat
    @Binding var selcolor5: Color
    @Binding var shadow2: CGFloat
    @Binding var rotation: Double
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width_calc_button, height: height_calc_button)
                .cornerRadius(round_btn)
                .shadow(color: selcolor4.opacity(shadow_opacity_1), radius: shadow1, x: shadow_pos_x, y: shadow_pos_y)
                .foregroundColor(color_border)
                .rotationEffect(Angle(degrees: rotate_btn))
            Text("")
                .frame(width: width_calc_button - width_border, height: height_calc_button - width_border)
                .background(selcolor)
                .foregroundColor(selcolor2)
                .cornerRadius(round_btn)
                .rotationEffect(Angle(degrees: rotate_btn))
            Text(selectedEmoji)
                .font(.system(size: font_size2_1))
                .offset(x: xemo, y: yemo)
                .rotationEffect(Angle(degrees: rotate_btn))
            Text(symbol)
                .foregroundColor(selcolor2)
                .font(.custom(fontName, size: font_size))
                .rotationEffect(Angle(degrees: rotate_btn + round_btn12))
                .shadow(color: selcolor5.opacity(shadow_opacity_1), radius: shadow2, x: 0, y: 0)
        }
        .rotation3DEffect(
                        Angle(degrees: rotation),
                        axis: (x: 0, y: 1, z: 0) // Rotate around the Y-axis
                    )
    }
}

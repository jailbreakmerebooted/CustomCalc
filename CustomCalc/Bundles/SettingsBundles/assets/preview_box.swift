import SwiftUI

struct preview_box: View {
    @Binding var width_calc_button: CGFloat
    @Binding var height_calc_button: CGFloat
    @Binding var selcolor: Color
    @Binding var selcolor2: Color
    @Binding var selcolor3: Color
    @Binding var selcolor4: Color
    @Binding var round_btn: CGFloat
    @Binding var font_size: CGFloat
    @Binding var shadow1: CGFloat
    @Binding var shadow_opacity_1: CGFloat
    @Binding var shadow_pos_y: CGFloat
    @Binding var shadow_pos_x: CGFloat
    @Binding var width_border: CGFloat
    @Binding var color_border: Color
    @Binding var rotate_btn: CGFloat
    @Binding var shadow2: CGFloat
    @Binding var selcolor5: Color
    @Binding var round_btn12: CGFloat
    @Binding var fontName: String
    @Binding var selectedEmoji: String
    @Binding var font_size2_1: CGFloat
    @Binding var font_size2_2: Int
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    @Binding var rotation: Double
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0)
                .frame(height: 200)
                .overlay {
                    ButtonLoader(height_calc_button: $height_calc_button, width_calc_button: $width_calc_button, round_btn: $round_btn, selcolor4: $selcolor4, shadow_opacity_1: $shadow_opacity_1, shadow_pos_x: $shadow_pos_x, shadow_pos_y: $shadow_pos_y, shadow1: $shadow1, color_border: $color_border, rotate_btn: $rotate_btn, width_border: $width_border, selcolor: $selcolor, selcolor2: $selcolor2, selectedEmoji: $selectedEmoji, font_size2_1: $font_size2_1, xemo: $xemo, yemo: $yemo, symbol: "0", font_size: $font_size, fontName: $fontName, round_btn12: $round_btn12, selcolor5: $selcolor5, shadow2: $shadow2, rotation: $rotation)
                }
            
        }
    }
}

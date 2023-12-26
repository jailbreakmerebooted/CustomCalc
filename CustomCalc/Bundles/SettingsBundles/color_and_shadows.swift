import SwiftUI

struct OtherCUSS: View {
    let colorPalette = [Color.black, Color.red, Color.blue, Color.green, Color.yellow, Color.white, Color.gray, Color.purple, Color.pink]
    @Binding var shadow1: CGFloat
    @Binding var width_calc_button: CGFloat
    @Binding var height_calc_button: CGFloat
    @Binding var selcolor: Color
    @Binding var selcolor2: Color
    @Binding var selcolor3: Color
    @Binding var round_btn: CGFloat
    @Binding var font_size: CGFloat
    @Binding var shadow_opacity_1: CGFloat
    @Binding var shadow_pos_x: CGFloat
    @Binding var shadow_pos_y: CGFloat
    @Binding var selcolor4: Color
    @Binding var width_border: CGFloat
    @Binding var color_border: Color
    @Binding var rotate_btn: CGFloat
    @Binding var shadow2: CGFloat
    @Binding var selcolor5: Color
    @Binding var round_btn12: CGFloat
    @Binding var uicolor: Color
    @Binding var colorString7: String
    @Binding var fontName: String
    @Binding var selectedEmoji: String
    @Binding var font_size2_1: CGFloat
    @Binding var font_size2_2: Int
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    @Binding var seluicolor: Color
    var body: some View {
        List {
            Section(header: Text("preview")) {
                preview_box(width_calc_button: $width_calc_button, height_calc_button: $height_calc_button, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn: $round_btn, font_size: $font_size, shadow1: $shadow1, shadow_opacity_1: $shadow_opacity_1, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, width_border: $width_border, color_border: $color_border, rotate_btn: $rotate_btn, shadow2: $shadow2, selcolor5: $selcolor5, round_btn12: $round_btn12, fontName: $fontName, selectedEmoji: $selectedEmoji, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo)
            }
            .listRowBackground(selcolor3)
            Section(header: Text("Button Shadow")) {
                    HStack {
                        Text("Shadow Brush")
                            .frame(width: 150)
                        Slider(value: $shadow1, in: 0...100)
                    }
                    HStack {
                        Text("Opacity")
                            .frame(width: 150)
                        Slider(value: $shadow_opacity_1, in: 0...1.0)
                    }
                    HStack {
                        Text("X")
                            .frame(width: 150)
                        Slider(value: $shadow_pos_x, in: -10.0...10.0)
                    }
                    HStack {
                        Text("Y")
                            .frame(width: 150)
                        Slider(value: $shadow_pos_y, in: -10.0...10.0)
                    }
            }
            Section(header: Text("Font Shadow")) {
                HStack {
                    Text("Shadow Brush")
                        .frame(width: 130)
                    Slider(value: $shadow2, in: 0...10)
                }
            }
            Section(header: Text("Color")) {
                ColorPicker("Background", selection: $selcolor3)
                ColorPicker("Module Background", selection: $selcolor)
                ColorPicker("Text", selection: $selcolor2)
                ColorPicker("Text Shadow", selection: $selcolor5)
                ColorPicker("Shadow Color", selection: $selcolor4)
                ColorPicker("Border Color", selection: $color_border)
            }
            Section(header: Text("UI")) {
                ColorPicker("Background UI", selection: $seluicolor)
                ColorPicker("Accent Color", selection: $uicolor)
            }
        }
        .background(seluicolor)
        .scrollContentBackground(.hidden)
        .navigationTitle("Color and Shadows")
    }
}

import SwiftUI

struct obset: View {
    @Binding var width_calc_button: CGFloat
    @Binding var width_calc_button2: Int
    @Binding var height_calc_button: CGFloat
    @Binding var height_calc_button2: Int
    @Binding var selcolor: Color
    @Binding var selcolor2: Color
    @Binding var selcolor3: Color
    @Binding var selcolor4: Color
    @Binding var round_btn2: Int
    @Binding var round_btn: CGFloat
    @Binding var font_size2: Int
    @Binding var font_size: CGFloat
    @Binding var shadow1: CGFloat
    @Binding var shadow1_2: Int
    @Binding var shadow_opacity_1: CGFloat
    @Binding var shadow_opacity_1_2: Int
    @Binding var shadow_pos_y: CGFloat
    @Binding var shadow_pos_x: CGFloat
    @Binding var shadow_pos_y_p: Int
    @Binding var shadow_pos_x_p: Int
    @Binding var grid_count: Int
    @Binding var symbols: [String]
    @Binding var width_border: CGFloat
    @Binding var color_border: Color
    @Binding var width_border1: Int
    @Binding var rotate_btn: CGFloat
    @Binding var rotate_btn1: Int
    @Binding var shadow2: CGFloat
    @Binding var shadow2_2: Int
    @Binding var hpt: UIImpactFeedbackGenerator.FeedbackStyle
    @Binding var sound: String
    @Binding var selcolor5: Color
    @Binding var colorString: String
    @Binding var colorString2: String
    @Binding var colorString3: String
    @Binding var colorString4: String
    @Binding var colorString5: String
    @Binding var colorString6: String
    @Binding var round_btn12: CGFloat
    @Binding var round_btn12_2: Int
    @Binding var height_output_box: CGFloat
    @Binding var height_output_box2: Int
    @Binding var width_output_box: CGFloat
    @Binding var width_output_box2: Int
    @Binding var spacing_outputbox: CGFloat
    @Binding var spacing_outputbox_down: CGFloat
    var body: some View {
        List {
            Section {
                ZStack {
                    Rectangle()
                        .frame(height: 250)
                        .foregroundColor(selcolor3)
                        .overlay {
                            Rectangle()
                                .frame(width: width_output_box, height: height_output_box)
                                .cornerRadius(round_btn)
                                .foregroundColor(selcolor)
                                .shadow(color: selcolor4.opacity(shadow_opacity_1), radius: shadow1, x: shadow_pos_x, y: shadow_pos_y)
                        }
                }
            }
            .listRowBackground(selcolor3)
            Section {
                HStack {
                    Text("Height")
                        .frame(width: 150)
                    Slider(value: $height_output_box, in: 0...500)
                }
                HStack {
                    Text("Width")
                        .frame(width: 150)
                    Slider(value: $width_output_box, in: 0...500)
                }
            }
        }
        .navigationTitle("Upperbox")
    }
}

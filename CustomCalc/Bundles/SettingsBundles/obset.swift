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
    @State private var heightopt_geo: CGFloat = 0
    @State private var widthopt_geo: CGFloat = 0
    @Binding var font_size3: CGFloat
    @Binding var font_size3_2: Int
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
                            VStack {
                                Text("0")
                                    .font(.system(size: font_size3))
                                    .foregroundColor(selcolor2)
                                    .frame(width: width_output_box-15, height: height_output_box-10)
                                
                                    .shadow(color: selcolor5.opacity(shadow_opacity_1), radius: shadow2, x: 0, y: 0)
                            }
                        }
                    }
                }
            .listRowBackground(selcolor3)
            Section(header: Text("Box")) {
                    HStack {
                        Text("Height")
                            .frame(width: 150)
                        Slider(value: $height_output_box, in: 0...heightopt_geo) //500 > 250
                    }
                    HStack {
                        Text("Width")
                            .frame(width: 150)
                        Slider(value: $width_output_box, in: 0...widthopt_geo) //500
                }
            }
            Section(header: Text("Font")) {
                HStack {
                    Text("Size")
                        .frame(width: 150)
                    Slider(value: $font_size3, in: 0...50)
                }
            }
        }
        .navigationTitle("Upperbox")
        .onAppear {
            if UIDevice.current.userInterfaceIdiom == .pad {
                heightopt_geo = 300
                widthopt_geo = 1000
            } else {
                heightopt_geo = 250
                widthopt_geo = 400
            }
        }
    }
}

import SwiftUI

struct ColorSettings: View {
    let colorPalette = [Color.black, Color.red, Color.blue, Color.green, Color.yellow, Color.white, Color.gray, Color.purple, Color.pink]
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
    @Binding var width_border: CGFloat
    @Binding var color_border: Color
    @Binding var rotate_btn: CGFloat
    @Binding var shadow2: CGFloat
    @Binding var selcolor5: Color
    @Binding var round_btn12: CGFloat
    @Binding var round_btn12_2: Int
    @Binding var fontName: String
    @Binding var selectedEmoji: String
    @Binding var font_size2_1: CGFloat
    @Binding var font_size2_2: Int
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    @State private var height_calc_button_geo: CGFloat = 0
    @State private var width_calc_button_geo: CGFloat = 0
    @State private var font_size_geo: CGFloat = 0
    @State private var border_geo: CGFloat = 0
    @Binding var rotation: Double
    var body: some View {
        List {
            Section(header: Text("preview")) {
                preview_box(width_calc_button: $width_calc_button, height_calc_button: $height_calc_button, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn: $round_btn, font_size: $font_size, shadow1: $shadow1, shadow_opacity_1: $shadow_opacity_1, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, width_border: $width_border, color_border: $color_border, rotate_btn: $rotate_btn, shadow2: $shadow2, selcolor5: $selcolor5, round_btn12: $round_btn12, fontName: $fontName, selectedEmoji: $selectedEmoji, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo, rotation: $rotation)
            }
            .listRowBackground(selcolor3)
            Section(header: Text("Button")) {
                HStack {
                    Text("Height")
                        .frame(width: 150)
                    Slider(value: $height_calc_button, in: 0...height_calc_button_geo) //100
                }
                HStack {
                    HStack {
                        Text("Width")
                            .frame(width: 150)
                        Slider(value: $width_calc_button, in: 0...width_calc_button_geo) //100
                    }
                }
                HStack {
                    HStack {
                        Text("Roundness")
                            .frame(width: 150)
                        Slider(value: $round_btn, in: 0...25)
                    }
                }
                HStack {
                    Text("Rotation")
                        .frame(width: 150)
                    Slider(value: $rotate_btn, in: 0...360)
                }
                HStack {
                    Text("3D Rotation")
                        .frame(width: 150)
                    Slider(value: $rotation, in: 0.0...360.0)
                }
                NavigationLink(destination: EmojiPicker(selectedEmoji: $selectedEmoji, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, font_size_geo: $font_size_geo, xemo: $xemo, yemo: $yemo)) {
                    HStack {
                        Text("Background")
                            .frame(width: 150)
                    }
                }
            }
            Section(header: Text("Font")) {
                HStack {
                    Text("Size")
                        .frame(width: 150)
                    Slider(value: $font_size, in: 0...font_size_geo)
                }
                HStack {
                    Text("Rotation")
                        .frame(width: 150)
                    Slider(value: $round_btn12, in: 0...360)
                }
                NavigationLink(destination: fontopt(fontName: $fontName)) {
                    HStack {
                        Text("Font")
                            .frame(width: 150)
                    }
                }
            }
            Section(header: Text("Border")) {
                HStack {
                    Text("Width")
                        .frame(width: 150)
                    Slider(value: $width_border, in: 0...border_geo) //75
                }
            }
        }
                .navigationViewStyle(DefaultNavigationViewStyle())
                .padding(0)
                .navigationTitle("Shape")
                .onAppear {
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        height_calc_button_geo = 200
                        width_calc_button_geo = 200
                        font_size_geo = 80
                        border_geo = 150
                    } else {
                        height_calc_button_geo = 100
                        width_calc_button_geo = 100
                        font_size_geo = 75
                        border_geo = 75
                    }
                }
        }
}

struct fontopt: View {
    @Binding var fontName: String
    var body: some View {
        FontWheelPicker(fontName: $fontName)
    }
}

struct FontWheelPicker: View {
    @Binding var fontName: String
    @State private var fontSize: CGFloat = 20.0
    
    let fonts: [String] = [
        "Arial",
        "Avenir",
        "Baskerville",
        "Bodoni 72",
        "Bradley Hand",
        "Chalkboard SE",
        "Cochin",
        "Copperplate",
        "DIN Alternate",
        "DIN Condensed",
        "Futura",
        "Gill Sans",
        "Hoefler Text",
        "Iowan Old Style",
        "Menlo",
        "Noteworthy",
        "Optima",
        "Palatino",
        "Papyrus",
        "San Francisco",
        "Snell Roundhand",
        "Tahoma",
        "Trebuchet MS",
        "Zapfino",
        "Helvetica",
        "Courier",
        "Times New Roman",
        "Verdana"
    ]
    
    var body: some View {
        VStack {
            Text("Selected Font: \(fontName)")
                .font(.custom(fontName, size: fontSize))
                .padding()
            Spacer()
            Picker(selection: $fontName, label: Text("Select Font")) {
                ForEach(fonts, id: \.self) { font in
                    Text(font)
                        .font(.custom(font, size: 16.0))
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 150)
            Rectangle()
                .frame(height: 100)
                .opacity(0)
        }
    }
}

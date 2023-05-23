import SwiftUI

struct RootView: View {
    @State private var width_calc_button: CGFloat = 10.0
    @AppStorage("width_calc_button2") var width_calc_button2: Int = 50
    @State private var height_calc_button: CGFloat = 10.0
    @AppStorage("heigt_calc_button2") var height_calc_button2: Int = 170
    @State private var height_output_box: CGFloat = 170
    @AppStorage("height_output_box2") var height_output_box2: Int = 177
    @State private var width_output_box: CGFloat = 355
    @AppStorage("width_output_box2") var width_output_box2: Int = 355
    @State private var selcolor = Color.black
    @State private var selcolor2 = Color.black
    @State private var selcolor3 = Color.black
    @State private var selcolor4 = Color.black
    @State private var selcolor5 = Color.black
    @State private var shadow1: CGFloat = 10.0
    @AppStorage("shadow1_2") var shadow1_2: Int = 5
    @State private var shadow_opacity_1: CGFloat = 10.0
    @AppStorage("shadow_opacity_1_2") var shadow_opacity_1_2: Int = 10
    @State private var shadow2: CGFloat = 10.0
    @AppStorage("shadow2_2") var shadow2_2: Int = 5
    @State private var shadow_opacity_2: CGFloat = 10.0
    @AppStorage("shadow_opacity_2_2") var shadow_opacity_2_2: Int = 10
    @State private var round_btn: CGFloat = 10.0
    @AppStorage("round_btn2") var round_btn2: Int = 10
    @State private var round_btn12: CGFloat = 10.0
    @AppStorage("round_btn12_2") var round_btn12_2: Int = 10
    @State private var font_size: CGFloat = 10.0
    @AppStorage("font_size2") var font_size2: Int = 20
    @State private var shadow_pos_y: CGFloat = 1
    @AppStorage("shadow_pos_y_p") var shadow_pos_y_p: Int = 1
    @State private var shadow_pos_x: CGFloat = 1
    @AppStorage("shadow_pos_x_p") var shadow_pos_x_p: Int = 1
    @AppStorage("grid_count") var grid_count = 4
    @State private var symbols = ["AC", "sin", "cos", "tan", "7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", ".", "=", "+"]
    @AppStorage("width_border") var width_border1: Int = 10
    @State private var width_border: CGFloat = 0
    @State private var send_var = false
    @State private var color_border = Color.black
    @State private var rotate_btn: CGFloat = 0
    @AppStorage("rotate_btn1") var rotate_btn1 = 0
    @State private var setup = false
    @GestureState private var sshs = false
    @AppStorage("hpt") var hpt: UIImpactFeedbackGenerator.FeedbackStyle = .medium
    @AppStorage("sound") var sound = ""
    @State private var fomulary_store = "test"
    @State private var fomulary_acti = false
    @AppStorage("cs1") var colorString = ""
    @AppStorage("cs2") var colorString2 = ""
    @AppStorage("cs3") var colorString3 = ""
    @AppStorage("cs4") var colorString4 = ""
    @AppStorage("cs5") var colorString5 = ""
    @AppStorage("cs6") var colorString6 = ""
    @AppStorage("cs7") var colorString7 = ""
    @State private var uicolor = Color.black
    @AppStorage("setup_pres") var setup_pres = true
    @State private var spacing_outputbox: CGFloat = 10
    @State private var spacing_outputbox_down: CGFloat = 5
    @State private var spacing_grid_hor: CGFloat = 10
    @State private var spacing_grid_ver: CGFloat = 375
    @AppStorage("spaceotpbox") var spacing_outputbox_conv: Int = 10
    @AppStorage("spacegridhor") var spacing_grid_hor_conv: Int = 10
    @AppStorage("spacegridver") var spacing_grid_ver_conv: Int = 375
    @AppStorage("Arial") var fontName: String = "Gill Sans"
    let defaultSymbols = ["AC", "sin", "cos", "tan", "7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", ".", "=", "+"]
    var body: some View {
        if fomulary_acti == true {
            ZStack {
                HStack {
                    Text(fomulary_store)
                    Image(systemName: "xmark")
                        .foregroundColor(.blue)
                        .onTapGesture {
                        fomulary_acti = false
                        fomulary_store = ""
                    }
                }
            }
            .frame(height: 30)
        }
        TabView {
            Calculator(width_calc_button: $width_calc_button, height_calc_button: $height_calc_button, round_btn: $round_btn, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, font_size: $font_size, font_size2: $font_size2, width_calc_button2: $width_calc_button2, height_calc_button2: $height_calc_button2, shadow1: $shadow1, shadow1_2: $shadow1_2, round_btn2: $round_btn2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_x: $shadow_pos_x, shadow_pos_y: $shadow_pos_y, shadow_pos_x_p: $shadow_pos_x_p, shadow_pos_y_p: $shadow_pos_y_p, selcolor4: $selcolor4, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, send_var: $send_var, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, hpt: $hpt, sound: $sound, shadow2_2: $shadow2_2, selcolor5: $selcolor5, setup: $setup, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox_conv: $spacing_outputbox_conv, spacing_grid_hor_conv: $spacing_grid_hor_conv, spacing_grid_ver_conv: $spacing_grid_ver_conv, colorString7: $colorString7, uicolor: $uicolor, fontName: $fontName)
                        .tabItem {
                            Label("Calculator", systemImage: "plus.slash.minus")
                        }
            fomulary(fomulary_acti: $fomulary_acti, fomulary_store: $fomulary_store)
            .tabItem {
                Label("Formulary", systemImage: "function")
            }
            Notes()
            .tabItem {
                Label("Notes", systemImage: "pencil.and.outline")
            }
            SettingsView(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, shadow2_2: $shadow2_2, hpt: $hpt, sound: $sound, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, setup_pres: $setup_pres, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox_conv: $spacing_outputbox_conv, spacing_grid_hor_conv: $spacing_grid_hor_conv, spacing_grid_ver_conv: $spacing_grid_ver_conv, colorString7: $colorString7, uicolor: $uicolor, fontName: $fontName)
                        .tabItem {
                            Label("Settings", systemImage: "slider.horizontal.3")
                        }
        }
        .accentColor(uicolor)
        .onAppear {
            if setup_pres == true {
                setup = true
            }
            if setup == true {
                symbols = defaultSymbols
            }
        }
        .sheet(isPresented: $setup) {
            CustCalc.setup(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, shadow2_2: $shadow2_2, hpt: $hpt, sound: $sound, setup: $setup, selcolor5: $selcolor5, setup_pres: $setup_pres)
                .gesture(
                                    DragGesture()
                                        .updating($sshs) { value, state, _ in
                                            state = value.translation.height > 0
                                        }
                                )
        }

    }
}

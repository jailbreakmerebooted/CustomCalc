import SwiftUI
import UIKit
import Foundation

struct SettingsView: View {
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
    @Binding var setup_pres: Bool
    @State private var savedLayouts: [String: Layout] = [:]
    @State private var selectedLayout: Layout?
    @State private var layoutName: String = ""
    @Binding var spacing_outputbox: CGFloat
    @Binding var spacing_outputbox_down: CGFloat
    @Binding var spacing_grid_hor: CGFloat
    @Binding var spacing_grid_ver: CGFloat
    @Binding var spacing_outputbox_conv: Int
    @Binding var spacing_grid_hor_conv: Int
    @Binding var spacing_grid_ver_conv: Int
    @Binding var colorString7: String
    @Binding var uicolor: Color
    @Binding var fontName: String
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: obset(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, shadow2_2: $shadow2_2, hpt: $hpt, sound: $sound, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down)) {
                        Label("Upperbox", systemImage: "rectangle")
                    }
                    NavigationLink(destination: ColorSettings(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, width_border: $width_border, color_border: $color_border, rotate_btn: $rotate_btn, shadow2: $shadow2, selcolor5: $selcolor5, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, fontName: $fontName)) {
                        Label("Shape", systemImage: "square.on.circle") // Use the "square.on.circle" system image as the icon
                    }
                    NavigationLink(destination: OtherCUSS(shadow1: $shadow1, width_calc_button: $width_calc_button, height_calc_button: $height_calc_button, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, round_btn: $round_btn, font_size: $font_size, shadow_opacity_1: $shadow_opacity_1, shadow_pos_x: $shadow_pos_x, shadow_pos_y: $shadow_pos_y, selcolor4: $selcolor4, width_border: $width_border, color_border: $color_border, rotate_btn: $rotate_btn, shadow2: $shadow2, selcolor5: $selcolor5, round_btn12: $round_btn12, uicolor: $uicolor, colorString7: $colorString7, fontName: $fontName)) {
                        Label("Color and Shadows", systemImage: "eyedropper.halffull") // Use the "eyedropper.halffull" system image as the icon
                    }
                    NavigationLink(destination: GridSettings(grid_count: $grid_count, symbols: $symbols, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox: $spacing_outputbox)) {
                        Label("Grid", systemImage: "square.grid.2x2")
                    }
                    NavigationLink(destination: HAS(hpt: $hpt, sound: $sound)) {
                        Label("Haptics and Sound", systemImage: "waveform.path.ecg")
                    }
                    NavigationLink(destination: LayoutST(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, shadow2: $shadow2, rotate_btn1: $rotate_btn1, hpt: $hpt, sound: $sound, shadow2_2: $shadow2_2, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox_conv: $spacing_outputbox_conv, spacing_grid_hor_conv: $spacing_grid_hor_conv, spacing_grid_ver_conv: $spacing_grid_ver_conv, colorString7: $colorString7, uicolor: $uicolor, fontName: $fontName)) {
                        Label("Layouts", systemImage: "rectangle.stack")
                    }
                }
                Section() {
                    NavigationLink(destination: debug(colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn: $round_btn, height_calc_button: $height_calc_button, width_calc_button: $width_calc_button, setup_pres: $setup_pres)) {
                            Label("Debug", systemImage: "exclamationmark.triangle")
                        }
                            NavigationLink(destination: Credits()) {
                                Label("Credits", systemImage: "person.3")
                            }
                    }
                Button(action: {
                    round_btn2 = Int(round_btn)
                    font_size2 = Int(font_size)
                    width_calc_button2 = Int(width_calc_button)
                    height_calc_button2 = Int(height_calc_button)
                    width_output_box2 = Int(width_output_box)
                    height_output_box2 = Int(height_output_box)
                    shadow1_2 = Int(shadow1)
                    shadow_opacity_1_2 = Int(shadow_opacity_1)
                    shadow_pos_x_p = Int(shadow_pos_x)
                    shadow_pos_y_p = Int(shadow_pos_y)
                    width_border1 = Int(width_border)
                    rotate_btn1 = Int(rotate_btn)
                    shadow2_2 = Int(shadow2)
                    round_btn12_2 = Int(round_btn12)
                    spacing_outputbox_conv = Int(spacing_outputbox)
                    spacing_grid_hor_conv = Int(spacing_grid_hor)
                    spacing_grid_ver_conv = Int(spacing_grid_ver)
                    convcolor()
                }, label: {
                    HStack {
                        Image(systemName: "checkmark.circle") // Use the "checkmark.circle" system image as the icon
                        Text("Quick Save")
                    }
                })
            }
            .navigationTitle("Settings")
            
        }
    }
    private func colorToHexString(_ color: Color) -> String {
        let uiColor = UIColor(color)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", redInt, greenInt, blueInt)
    }
    
    private func hexStringToColor(_ hexString: String) -> Color {
        var formattedHexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if formattedHexString.hasPrefix("#") {
            formattedHexString.remove(at: formattedHexString.startIndex)
        }
        
        if formattedHexString.count != 6 {
            return .black
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: formattedHexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    private func convcolor() {
        colorString = colorToHexString(selcolor)
        colorString2 = colorToHexString(selcolor2)
        colorString3 = colorToHexString(selcolor3)
        colorString4 = colorToHexString(selcolor4)
        colorString5 = colorToHexString(color_border)
        colorString6 = colorToHexString(selcolor5)
        colorString7 = colorToHexString(uicolor)
    }
    
    private func convcolorback() {
        selcolor = hexStringToColor(colorString)
        selcolor2 = hexStringToColor(colorString2)
        selcolor3 = hexStringToColor(colorString3)
        selcolor4 = hexStringToColor(colorString4)
        selcolor5 = hexStringToColor(colorString6)
        color_border = hexStringToColor(colorString5)
        uicolor = hexStringToColor(colorString7)
    }
}

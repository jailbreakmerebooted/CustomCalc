import SwiftUI
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
    @Binding var selectedEmoji: String
    @Binding var gesturefield1: Int
    @Binding var gesturefield2: Int
    @Binding var gesturefield3: Int
    @Binding var gesture: Int
    @Binding var font_size2_1: CGFloat
    @Binding var font_size2_2: Int
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    @Binding var offsetx: Int
    @Binding var offsety: Int
    @Binding var font_size3: CGFloat
    @Binding var font_size3_2: Int
    @Binding var fontName2: String
    @Binding var tabbar1: String
    @Binding var tabbar2: String
    @Binding var tabbar3: String
    @Binding var tabbar4: String
    @Binding var rotation: Double
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: obset(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, shadow2_2: $shadow2_2, hpt: $hpt, sound: $sound, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, font_size3: $font_size3, font_size3_2: $font_size3_2, rotation: $rotation)) {
                        Label("Upperbox", systemImage: "rectangle")
                    }
                    NavigationLink(destination: ColorSettings(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, width_border: $width_border, color_border: $color_border, rotate_btn: $rotate_btn, shadow2: $shadow2, selcolor5: $selcolor5, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, fontName: $fontName, selectedEmoji: $selectedEmoji, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo, rotation: $rotation)) {
                        Label("Shape", systemImage: "square.on.circle") // Use the "square.on.circle" system image as the icon
                    }
                    NavigationLink(destination: OtherCUSS(shadow1: $shadow1, width_calc_button: $width_calc_button, height_calc_button: $height_calc_button, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, round_btn: $round_btn, font_size: $font_size, shadow_opacity_1: $shadow_opacity_1, shadow_pos_x: $shadow_pos_x, shadow_pos_y: $shadow_pos_y, selcolor4: $selcolor4, width_border: $width_border, color_border: $color_border, rotate_btn: $rotate_btn, shadow2: $shadow2, selcolor5: $selcolor5, round_btn12: $round_btn12, uicolor: $uicolor, colorString7: $colorString7, fontName: $fontName, selectedEmoji: $selectedEmoji, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo, rotation: $rotation)) {
                        Label("Color and Shadows", systemImage: "eyedropper.halffull") // Use the "eyedropper.halffull" system image as the icon
                    }
                    NavigationLink(destination: GridSettings(grid_count: $grid_count, symbols: $symbols, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox: $spacing_outputbox)) {
                        Label("Grid", systemImage: "square.grid.2x2")
                    }
                    NavigationLink(destination: HAS(hpt: $hpt, sound: $sound)) {
                        Label("Haptics and Sound", systemImage: "waveform.path.ecg")
                    }
                    NavigationLink(destination: gesturebundle(gesturefield1: $gesturefield1, gesturefield2: $gesturefield2, gesturefield3: $gesturefield3, gesture: $gesture)) {
                        Label("Gestures", systemImage: "hand.draw")
                    }
                    NavigationLink(destination: notest(fontName2: $fontName2)) {
                        Label("Notes", systemImage: "doc.plaintext")
                    }
                    NavigationLink(destination: TabPick(tabbar1: $tabbar1, tabbar2: $tabbar2, tabbar3: $tabbar3, tabbar4: $tabbar4)) {
                        Label("TabBar", systemImage: "tablecells")
                    }
                    NavigationLink(destination: LayoutST(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, shadow2: $shadow2, rotate_btn1: $rotate_btn1, hpt: $hpt, sound: $sound, shadow2_2: $shadow2_2, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox_conv: $spacing_outputbox_conv, spacing_grid_hor_conv: $spacing_grid_hor_conv, spacing_grid_ver_conv: $spacing_grid_ver_conv, colorString7: $colorString7, uicolor: $uicolor, fontName: $fontName, selectedEmoji: $selectedEmoji, gesturefield1: $gesturefield1, gesturefield2: $gesturefield2, gesturefield3: $gesturefield3,font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo, offsetx: $offsetx, offsety: $offsety, font_size3: $font_size3, font_size3_2: $font_size3_2, tabbar1: $tabbar1, tabbar2: $tabbar2, tabbar3: $tabbar3, tabbar4: $tabbar4, rotation: $rotation)) {
                        Label("Layouts", systemImage: "rectangle.stack")
                    }
                }
                Section {
                    NavigationLink(destination: arg()) {
                        Label("License Agreement", systemImage: "checkmark.seal")
                    }
                    NavigationLink(destination: updates()) {
                        Label("Changelog", systemImage: "doc")
                    }
                    NavigationLink(destination: Credits()) {
                                Label("Credits", systemImage: "person.3")
                            }
                    
                    
                }
            }
            .navigationTitle("Settings")
        }
    }
}

import SwiftUI

struct RootView: View {
    @State private var width_calc_button: CGFloat = 100.0
    @AppStorage("width_calc_button2") var width_calc_button2: Int = 100
    @State private var height_calc_button: CGFloat = 100.0
    @AppStorage("heigt_calc_button2") var height_calc_button2: Int = 100
    @State private var height_output_box: CGFloat = 170
    @AppStorage("height_output_box2") var height_output_box2: Int = 177
    @State private var width_output_box: CGFloat = 355
    @AppStorage("width_output_box2") var width_output_box2: Int = 330
    @State private var selcolor = Color.gray
    @State private var selcolor2 = Color.white
    @State private var selcolor3 = Color.gray
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
    @State private var font_size2_1: CGFloat = 10.0
    @AppStorage("font_size3_2") var font_size3_2: Int = 20
    @State private var font_size3: CGFloat = 10.0
    @AppStorage("font_size2_2") var font_size2_2: Int = 20
    @State private var font_size: CGFloat = 10.0
    @AppStorage("font_size2") var font_size2: Int = 20
    @State private var shadow_pos_y: CGFloat = 1
    @AppStorage("shadow_pos_y_p") var shadow_pos_y_p: Int = 1
    @State private var shadow_pos_x: CGFloat = 1
    @AppStorage("shadow_pos_x_p") var shadow_pos_x_p: Int = 1
    @AppStorage("grid_count") var grid_count = 4
    @State private var symbols = ["AC", "sin", "cos", "tan", "7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", ".", "=", "+"]
    @State private var cph: [String] = []
    @State private var cpoh: [String] = []
    @AppStorage("width_border") var width_border1: Int = 10
    @State private var width_border: CGFloat = 0
    @State private var send_var = false
    @State private var color_border = Color.red
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
    @State private var uicolor = Color.blue
    @State private var spacing_outputbox: CGFloat = 10
    @State private var spacing_outputbox_down: CGFloat = 5
    @State private var spacing_grid_hor: CGFloat = 10
    @State private var spacing_grid_ver: CGFloat = 375
    @AppStorage("spaceotpbox") var spacing_outputbox_conv: Int = 20
    @AppStorage("spacegridhor") var spacing_grid_hor_conv: Int = 10
    @AppStorage("spacegridver") var spacing_grid_ver_conv: Int = 350
    @AppStorage("Arial") var fontName: String = "Gill Sans"
    @AppStorage("Arial2") var fontName2: String = "Gill Sans"
    @AppStorage("BGEmoji") var selectedEmoji: String = ""
    @AppStorage("gf1") var gesturefield1: Int = 0
    @AppStorage("gf2") var gesturefield2: Int = 0
    @AppStorage("gf3") var gesturefield3: Int = 0
    @AppStorage("statusgghh") var statusgghh: Bool = true
    @State private var xemo: CGFloat = 0.0
    @State private var yemo: CGFloat = 0.0
    @State private var gesture: Int = 0
    @AppStorage("offsetx") var offsetx: Int = 0
    @AppStorage("offsety") var offsety: Int = 0
    @AppStorage("tabbaritem1") var tabbar1: String = "plus.slash.minus"
    @AppStorage("tabbaritem2") var tabbar2: String = "clock.arrow.circlepath"
    @AppStorage("tabbaritem3") var tabbar3: String = "pencil.and.outline"
    @AppStorage("tabbaritem4") var tabbar4: String = "slider.horizontal.3"
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
            Calculator(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, shadow2_2: $shadow2_2, hpt: $hpt, sound: $sound, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox_conv: $spacing_outputbox_conv, spacing_grid_hor_conv: $spacing_grid_hor_conv, spacing_grid_ver_conv: $spacing_grid_ver_conv, colorString7: $colorString7, uicolor: $uicolor, fontName: $fontName, selectedEmoji: $selectedEmoji, gesturefield1: $gesturefield1, gesturefield2: $gesturefield2, gesturefield3: $gesturefield3, gesture: $gesture, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo, offsetx: $offsetx, offsety: $offsety, font_size3: $font_size3, font_size3_2: $font_size3_2, fontName2: $fontName2, tabbar1: $tabbar1, tabbar2: $tabbar2, tabbar3: $tabbar3, tabbar4: $tabbar4, cph: $cph, coph: $cpoh)
                .tabItem {
                    Label("Calculator", systemImage: tabbar1)
                }
            historybundle(cph: $cph, coph: $cpoh, uicolor: $uicolor)
                .tabItem {
                    Label("History", systemImage: tabbar2)
                }
            Notes(fontName2: $fontName2)
                .tabItem {
                    Label("Notes", systemImage: tabbar3)
                }
            /*SettingsView(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, shadow2_2: $shadow2_2, hpt: $hpt, sound: $sound, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox_conv: $spacing_outputbox_conv, spacing_grid_hor_conv: $spacing_grid_hor_conv, spacing_grid_ver_conv: $spacing_grid_ver_conv, colorString7: $colorString7, uicolor: $uicolor, fontName: $fontName, selectedEmoji: $selectedEmoji, gesturefield1: $gesturefield1, gesturefield2: $gesturefield2, gesturefield3: $gesturefield3, gesture: $gesture, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo, offsetx: $offsetx, offsety: $offsety, font_size3: $font_size3, font_size3_2: $font_size3_2, fontName2: $fontName2, tabbar1: $tabbar1, tabbar2: $tabbar2, tabbar3: $tabbar3, tabbar4: $tabbar4)
                .tabItem {
                    Label("Settings", systemImage: tabbar4)
                }*/
        }
        .accentColor(uicolor)
        .fullScreenCover(isPresented: $statusgghh) {
            VStack {
                HStack {
                    Rectangle()
                        .frame(width: 5)
                        .opacity(0)
                    ScrollView {
                        Text("""
------------------------
LICENSE AGREEMENT
------------------------

This License Agreement "Personal License Agreement" is entered into between Sean Boleslawski (referred to as the "Licensor") and "Personal License Agreement" (referred to as the "Licensee"). Collectively, Licensor and Licensee shall be referred to as the "Parties."

WHEREAS, Licensor is the owner of a calculator software application named "CustCalc" (the "Software") that provides various mathematical functions and operations, including the ability to customize the shape, color, size of the buttons, background, and output box, as well as the function to save and load layouts, and customizable gestures, as well as the function to save copied text from the output, as well as the feature to save the copied stuff in the history, as well as the function to save notes;

WHEREAS, Licensee desires to obtain a personal license to use the Software, including the customization features and the layout saving and loading functions, under the terms and conditions set forth in this Agreement;
NOW, THEREFORE, in consideration of the mutual promises and covenants contained herein, the Parties agree as follows:

1. Grant of License
Licensor hereby grants Licensee a non-exclusive, non-transferable personal license to use the "CustCalc" Software including the customization features, layout saving and loading functions, and customizable gestures, for personal purposes only, subject to the terms and conditions of this Agreement. The license permits Licensee to install and use the "CustCalc" Software on multiple personal devices solely for the purpose of performing mathematical calculations, customizing the visual aspects of the calculator interface, saving layouts, loading previously saved layouts, and customizing gestures for personal use.

2. Restrictions
Licensee shall not, directly or indirectly, do any of the following:

a) Modify, reverse engineer, decompile, or disassemble the "CustCalc" Software, in whole or in part, or create derivative works based upon the Software.
b) Distribute, sublicense, lease, rent, loan, or otherwise make the "CustCalc" Software available to any third party.
c) Remove or alter any proprietary notices or labels on the "CustCalc" Software.
d) Use the "CustCalc" Software for any unlawful purpose or in any manner that violates applicable laws or regulations.
e) Use the "CustCalc" Software to collect, track, store, or transmit any personal data or confidential information of users without their explicit consent.

3. Ownership and Intellectual Property Rights
Licensor, Sean Boleslawski, retains all rights, title, and interest, including intellectual property rights, in and to the "CustCalc" Software. This Agreement does not transfer any ownership rights or grant Licensee any right, title, or interest in the "CustCalc" Software, except for the limited personal license expressly granted herein.

4. Warranty Disclaimer
THE "CUSTCALC" SOFTWARE IS PROVIDED "AS IS," WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. LICENSOR DISCLAIMS ALL WARRANTIES, WHETHER EXPRESS, IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.

5. Limitation of Liability
IN NO EVENT SHALL LICENSOR BE LIABLE TO LICENSEE OR ANY THIRD PARTY FOR ANY INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES ARISING OUT OF OR IN CONNECTION WITH THE USE OF THE "CUSTCALC" SOFTWARE, INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, LOST DATA, OR PERSONAL INJURY, WHETHER BASED ON WARRANTY, CONTRACT, TORT, OR ANY OTHER LEGAL THEORY, EVEN IF LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

6. Termination
Either Party may terminate this Agreement for any reason by providing written notice to the other Party. Upon termination, Licensee shall immediately cease all use of the "CustCalc" Software and destroy any copies of the Software in Licensee’s prossession or control.

7. Entire Agreement
This Agreement constitutes the entire understanding between the Parties concerning the subject matter hereof and supersedes all prior agreements, understandings, negotiations, and discussions, whether oral or written.

IN WITNESS WHEREOF, the Parties have executed this License Agreement as of 29th May 2023.
""")
                        Rectangle()
                            .frame(height: 50)
                            .opacity(0)
                        Button("Accept") {
                            statusgghh = false
                        }
                        .frame(width: 250, height: 75)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                        Rectangle()
                            .frame(height: 50)
                            .opacity(0)
                    }
                    Rectangle()
                        .frame(width: 5)
                        .opacity(0)
                }
            }
        }
    }
}

import SwiftUI
import UIKit

struct setup: View {
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
    @Binding var setup: Bool
    @Binding var selcolor5: Color
    @Binding var setup_pres: Bool
    @State private var savedLayouts: [String: Layout] = [:]
    @State private var selectedLayout: Layout?
    @State private var layoutName: String = ""
    var body: some View {
        NavigationView {
            VStack {
                    List {
                        Text("CustomCalc 0.3")
                        Text("Update Type: Polished Update")
                        Text("""
-added ability to change the accent color
-fixed wrong written text in some sections
-updated layout algorithm
 ^-accent color added
 ^-added Switches to change what it is applying
 ^-added font name
-added ability to change the font it self
-fully patched the sound none issue
-added dilan to credits for some really genius ideas :)
""")
                        .font(.system(size: 16))
                    }
                    Spacer()
                    Rectangle()
                        .frame(height: 20)
                        .opacity(0)
                    Button("Let me test the App") {
                        setup = false
                    }
                    .frame(width: 280, height: 55)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                ZStack {
                    Button("Never show me this again") {
                        setup_pres = false
                        setup = false
                    }
                    .frame(width: 280, height: 55)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .opacity(0.7)
                }
            }
                .navigationTitle("Updated")
            }
            Rectangle()
                .frame(height: 20)
                .opacity(0)
        }
    }

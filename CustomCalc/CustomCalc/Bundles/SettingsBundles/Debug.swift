import SwiftUI
import UIKit

struct debug: View {
    @Binding var colorString: String
    @Binding var colorString2: String
    @Binding var colorString3: String
    @Binding var colorString4: String
    @Binding var colorString5: String
    @Binding var colorString6: String
    @Binding var round_btn: CGFloat
    @Binding var height_calc_button: CGFloat
    @Binding var width_calc_button: CGFloat
    @Binding var setup_pres: Bool
    var body: some View {
        List {
            NavigationLink(destination: debugshape(round_btn: $round_btn, height_calc_button: $height_calc_button, width_calc_button: $width_calc_button)) {
                Text("Shape")
            }
            NavigationLink(destination: debugcolor(colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6)) {
                Text("Color")
            }
            NavigationLink(destination: SetupOpt(setup_pres: $setup_pres)) {
                Text("Setup")
            }
        }
        .navigationTitle("Debug")
    }
}

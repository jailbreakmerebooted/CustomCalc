import SwiftUI
import UIKit

struct debugshape: View {
    @Binding var round_btn: CGFloat
    @Binding var height_calc_button: CGFloat
    @Binding var width_calc_button: CGFloat
    @State private var round_string = ""
    @State private var round_Int = 0
    var body: some View {
        List {
            Section {
                TextField("Roundness", text: $round_string)
            }
            Button("Save Values") {
                round_Int = Int(round_string)!
                round_btn = CGFloat(Int(round_string)!)
            }
        }
        .onAppear {
            round_string = String(Int(round_btn))
        }
    }
}

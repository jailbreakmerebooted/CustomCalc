import SwiftUI
import UIKit

struct dragon_fom_shapes: View {
    @Binding var fomulary_acti: Bool
    @Binding var fomulary_store: String
    var body: some View {
        List {
            HStack {
                Button("") {
                    fomulary_acti = true
                    fomulary_store = "Surface area of the dragon: A = (e·f)÷2"
                }
                Text("Surface area of the dragon: A = (e·f)÷2")
            }
            HStack {
                Button("") {
                    fomulary_acti = true
                    fomulary_store = "Scope of the dragon: 2·a+2·b"
                }
                Text("Scope of the dragon: 2·a+2·b")
            }
        }
    }
}

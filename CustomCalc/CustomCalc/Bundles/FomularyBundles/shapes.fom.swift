import SwiftUI
import UIKit
import Foundation

struct shapes_fom: View {
    @Binding var fomulary_acti: Bool
    @Binding var fomulary_store: String
    var body: some View {
        List {
            NavigationLink(destination: circle_fom_shapes(fomulary_acti: $fomulary_acti, fomulary_store: $fomulary_store)) {
                Text("Circle")
            }
            NavigationLink(destination: square_fom_shapes(fomulary_acti: $fomulary_acti, fomulary_store: $fomulary_store)) {
                Text("Square")
            }
            NavigationLink(destination: rectangle_fom_shapes(fomulary_acti: $fomulary_acti, fomulary_store: $fomulary_store)) {
                Text("Rectangle")
            }
            NavigationLink(destination: parallelogram_fom_shapes(fomulary_acti: $fomulary_acti, fomulary_store: $fomulary_store)) {
                Text("Parallelogram")
            }
            NavigationLink(destination: dragon_fom_shapes(fomulary_acti: $fomulary_acti, fomulary_store: $fomulary_store)) {
                Text("Dragon")
            }
        }
        .navigationTitle("Shapes")
    }
}

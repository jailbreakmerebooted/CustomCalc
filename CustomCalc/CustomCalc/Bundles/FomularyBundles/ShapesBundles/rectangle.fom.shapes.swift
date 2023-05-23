import SwiftUI
import UIKit

struct rectangle_fom_shapes: View {
    @Binding var fomulary_acti: Bool
    @Binding var fomulary_store: String
    var body: some View {
        List {
            Section {
                ZStack {
                    Image("rectangle")
                                .resizable() // Make the image resizable
                                .scaledToFill() // Maintain the aspect ratio and fill the available space
                                .scaleEffect(1.15)
                }
            }
            Section {
                Text("A rectangle has four 90 degree angles and two pairs of sites the same size.")
            }
            Section {
                HStack {
                    Button("") {
                        fomulary_acti = true
                        fomulary_store = "Surface area of the rectangle: A = a·b"
                    }
                    Text("Surface area of the rectangle: A = a·b")
                }
                HStack {
                    Button("") {
                        fomulary_acti = true
                        fomulary_store = "Scope of the rectangle: u = 2a+2b"
                    }
                    Text("Scope of the rectangle: u = 2a+2b")
                }
            }
        }
        .navigationTitle("Rectangle")
    }
}

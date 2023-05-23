import SwiftUI
import UIKit

struct circle_fom_shapes: View {
    @Binding var fomulary_acti: Bool
    @Binding var fomulary_store: String
    var body: some View {
        List {
            Section {
                ZStack {
                    Image("circle")
                                .resizable() // Make the image resizable
                                .scaledToFill() // Maintain the aspect ratio and fill the available space
                                .scaleEffect(1.15)
                }
            }
            Section {
                HStack {
                    Button("") {
                        fomulary_acti = true
                        fomulary_store = "Surface area of the circle: A = π·r²"
                    }
                    Text("Surface area of the circle: A = π·r²")
                }
                HStack {
                    Button("") {
                        fomulary_acti = true
                        fomulary_store = "Scope of the circle: u = 2π·r"
                    }
                    Text("Scope of the circle: u = 2π·r")
                }
            }
        }
        .navigationTitle("Circle")
    }
}

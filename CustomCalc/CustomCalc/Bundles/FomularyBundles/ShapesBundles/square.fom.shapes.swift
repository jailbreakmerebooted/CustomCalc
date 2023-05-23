import SwiftUI
import UIKit

struct square_fom_shapes: View {
    @Binding var fomulary_acti: Bool
    @Binding var fomulary_store: String
    var body: some View {
        List {
            Section {
                ZStack {
                    Image("square")
                                .resizable() // Make the image resizable
                                .scaledToFill() // Maintain the aspect ratio and fill the available space
                                .scaleEffect(1.15)
                }
            }
            Section {
                Text("A square has four 90 degree angles and four sides with the same lenght.")
            }
            Section {
                HStack {
                    Button("") {
                        fomulary_acti = true
                        fomulary_store = "Surface area of the square: A = a²"
                    }
                    Text("Surface area of the square: A = a²")
                }
                HStack {
                    Button("") {
                        fomulary_acti = true
                        fomulary_store = "Scope of the Square: u = 4·a"
                    }
                    Text("Scope of the Square: u = 4·a")
                }
            }
        }
        .navigationTitle("Square")
    }
}

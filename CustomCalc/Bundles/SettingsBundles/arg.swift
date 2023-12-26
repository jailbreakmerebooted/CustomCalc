import SwiftUI

struct arg: View {
    @Binding var seluicolor: Color
    var body: some View {
        List {
            License()
        }
        .background(seluicolor)
        .scrollContentBackground(.hidden)
        .navigationTitle("License Agreement")
    }
}

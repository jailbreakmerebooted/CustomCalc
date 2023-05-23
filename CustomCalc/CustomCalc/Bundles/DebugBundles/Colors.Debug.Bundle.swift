import SwiftUI
import UIKit

struct debugcolor: View {
    @Binding var colorString: String
    @Binding var colorString2: String
    @Binding var colorString3: String
    @Binding var colorString4: String
    @Binding var colorString5: String
    @Binding var colorString6: String
    var body: some View {
        List {
            TextField("\(colorString)", text: $colorString)
            TextField("\(colorString2)", text: $colorString2)
            TextField("\(colorString3)", text: $colorString3)
            TextField("\(colorString4)", text: $colorString4)
            TextField("\(colorString5)", text: $colorString5)
            TextField("\(colorString6)", text: $colorString6)
        }
        .navigationTitle("Debug > Color")
    }
}

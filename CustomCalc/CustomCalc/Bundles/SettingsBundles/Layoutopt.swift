import SwiftUI

struct layoutopt: View {
    @Binding var ColorSwitch: Bool
    @Binding var ShapeSwitch: Bool
    @Binding var GridSwitch: Bool
    var body: some View {
        List {
            Text("These are Options in an test build of Version 0.3")
            Section(header: Text("Apply Settings")) {
                Toggle(isOn: $ColorSwitch) {
                    Text("Apply Color")
                }
                Toggle(isOn: $ShapeSwitch) {
                    Text("Apply Shape")
                }
                Toggle(isOn: $GridSwitch) {
                    Text("Apply Grid")
                }
            }
        }
    }
}

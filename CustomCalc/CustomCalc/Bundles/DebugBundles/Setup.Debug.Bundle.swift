import SwiftUI

struct SetupOpt: View {
    @Binding var setup_pres: Bool
    var body: some View {
        List {
            Toggle(isOn: $setup_pres) {
                            Text("Setup shown in the beginning")
                        }
        }
    }
}

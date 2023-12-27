import SwiftUI

struct gesturebundle: View {
    @Binding var gesturefield1: Int
    @Binding var gesturefield2: Int
    @Binding var gesturefield3: Int
    @Binding var gesture: Int
    private let segments = ["None", "Clear Number", "Equal"]
    private let segments2 = ["None", "Clear Number", "Equal"]
    private let segments3 = ["None", "Clear Number", "Equal"]
    var body: some View {
        List {
            Section() {
            VStack {
                Text("Swipe to the left")
                Picker("", selection: $gesturefield1) {
                    ForEach(0..<segments.count) { index in
                        Text(segments[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Text("Selected option: \(segments[gesturefield1])")
                    .padding()
            }
        }
            Section(footer: Text("To use the gestures, then you need to swipe on the outputbox")) {
                VStack {
                    Text("Swipe to the right")
                    Picker("", selection: $gesturefield2) {
                        ForEach(0..<segments2.count) { index in
                            Text(segments2[index])
                                .tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Selected option: \(segments2[gesturefield2])")
                        .padding()
                }
            }
        }
        .navigationTitle("Gestures")
    }
}

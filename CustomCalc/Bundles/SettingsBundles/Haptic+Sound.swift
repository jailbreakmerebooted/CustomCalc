import SwiftUI

struct HAS: View {
    @Binding var hpt: UIImpactFeedbackGenerator.FeedbackStyle
    @Binding var sound: String
    @Binding var seluicolor: Color
    
    let hapticOptions: [(String, UIImpactFeedbackGenerator.FeedbackStyle)] = [
        ("Light", .light),
        ("Medium", .medium),
        ("Heavy", .heavy),
        ("Soft", .soft),
        ("Rigid", .rigid),
    ]
    let SoundOptions: [(String, String)] = [
        ("None", ""),
        ("Keyboard", "keyboard.mp3")
    ]
    
    var body: some View {
        List {
            Picker(selection: $hpt, label: Text("Haptic Feedback")) {
                ForEach(hapticOptions, id: \.1) { option in
                    Text(option.0).tag(option.1)
                }
            }
            Picker(selection: $sound, label: Text("Sound on Tap")) {
                ForEach(SoundOptions, id: \.1) { option in
                    Text(option.0).tag(option.1)
                }
            }
        }
        .background(seluicolor)
        .scrollContentBackground(.hidden)
        .navigationTitle("Haptics and Sound")
    }
}

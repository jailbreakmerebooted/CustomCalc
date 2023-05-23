import SwiftUI

struct HAS: View {
    @Binding var hpt: UIImpactFeedbackGenerator.FeedbackStyle
    @Binding var sound: String
    
    let hapticOptions: [(String, UIImpactFeedbackGenerator.FeedbackStyle)] = [
        ("Light", .light),
        ("Medium", .medium),
        ("Heavy", .heavy),
        ("Soft", .soft),
        ("Rigid", .rigid),
    ]
    let SoundOptions: [(String, String)] = [
        ("None", ""),
        ("Cat", "meow.mp3"),
        ("Keyboard", "key.mp3"),
        ("Glass Break", "glass-crash.mp3"),
        ("Cow", "cow.mp3"),
        ("Cinematic Drum Hit", "cinematic_hit.mp3")
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
        .navigationTitle("Haptics and Sound")
    }
}

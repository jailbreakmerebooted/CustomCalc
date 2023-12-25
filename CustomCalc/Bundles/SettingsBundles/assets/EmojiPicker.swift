import SwiftUI

struct EmojiPickerView: View {
    let emojiData = [
        ["", "😃", "😄", "😁", "😆"],
        ["😍", "🥰", "😘", "😊", "😎"],
        ["💕", "❤️", "🧡", "💛", "💚"],
        ["💗", "💙", "💜", "❤️‍🔥", "❤️‍🩹"],
        ["👍", "👏", "🙌", "👌", "🤘"]
    ]
    
    @Binding var selectedEmoji: String
    
    var body: some View {
        VStack {
            Picker(selection: $selectedEmoji, label: Text("")) {
                ForEach(0 ..< emojiData.count) { section in
                    ForEach(0 ..< emojiData[section].count) { index in
                        Text(self.emojiData[section][index])
                            .font(.system(size: 30))
                            .tag(self.emojiData[section][index])
                    }
                }
            }
            .pickerStyle(WheelPickerStyle())
            .labelsHidden()
        }
        .frame(height: 200)
        .padding()
    }
}

struct EmojiPicker: View {
    @Binding var selectedEmoji: String
    @Binding var font_size2_1: CGFloat
    @Binding var font_size2_2: Int
    @Binding var font_size_geo: CGFloat
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    var body: some View {
        List {
            Section {
                Text("Selected Emoji: \(selectedEmoji)")
                
                EmojiPickerView(selectedEmoji: $selectedEmoji)
            }
            Section {
                HStack {
                    Text("Size")
                        .frame(width: 150)
                    Slider(value: $font_size2_1, in: 0...font_size_geo)
                }
                HStack {
                    Text("x")
                        .frame(width: 150)
                    Slider(value: $xemo, in: -30...30)
                }
                HStack {
                    Text("y")
                        .frame(width: 150)
                    Slider(value: $yemo, in: -30...30)
                }
                Button("Restore Defaults") {
                    xemo = 0.0
                    yemo = 0.0
                }
            }
        }
    }
}

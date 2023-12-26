import SwiftUI

struct notest: View {
    @Binding var fontName2: String
    @Binding var seluicolor: Color
    var body: some View {
        List {
            FontWheelPicker2(fontName2: $fontName2)
        }
        .background(seluicolor)
        .scrollContentBackground(.hidden)
        .navigationTitle("Notes")
    }
}

struct FontWheelPicker2: View {
    @Binding var fontName2: String
    
    let fonts: [String] = [
        "Arial",
        "Avenir",
        "Baskerville",
        "Bodoni 72",
        "Bradley Hand",
        "Chalkboard SE",
        "Cochin",
        "Copperplate",
        "DIN Alternate",
        "DIN Condensed",
        "Futura",
        "Gill Sans",
        "Hoefler Text",
        "Iowan Old Style",
        "Menlo",
        "Noteworthy",
        "Optima",
        "Palatino",
        "Papyrus",
        "San Francisco",
        "Snell Roundhand",
        "Tahoma",
        "Times New Roman",
        "Trebuchet MS",
        "Zapfino",
        "Helvetica",
        "Courier",
        "Verdana"
    ]
    
    var body: some View {
        VStack {
            Text("Selected Font: \(fontName2)")
                .font(.custom(fontName2, size: 20))
                .padding()
            Spacer()
            Picker(selection: $fontName2, label: Text("Select Font")) {
                ForEach(fonts, id: \.self) { font in
                    Text(font)
                        .font(.custom(font, size: 16.0))
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 150)
        }
    }
}

import SwiftUI
import UIKit

struct Layout: Codable, Identifiable {
    let id = UUID() // Unique identifier for the layout
    var width_calc_button: CGFloat
    var height_calc_button: CGFloat
    var roundBtn: CGFloat
    var symbols: [String]
    var grid_count: Int
    var shadow1: CGFloat
    var shadow_pos_y: CGFloat
    var shadow_pos_x: CGFloat
    var width_border: CGFloat
    var font_size: CGFloat
    var shadow_opacity_1: CGFloat
    var rotate_btn: CGFloat
    var color1: String
    var color2: String
    var color3: String
    var color4: String
    var color5: String
    var color6: String
    var color7: String
    var sound: String
    var shadow2: CGFloat
    var round_btn_12: CGFloat
    var width_box : CGFloat
    var height_box: CGFloat
    var grid_hor: CGFloat
    var grid_ver: CGFloat
    var grid_space: CGFloat
    var fontname: String
}

struct LayoutST: View {
    @Binding var width_calc_button: CGFloat
    @Binding var width_calc_button2: Int
    @Binding var height_calc_button: CGFloat
    @Binding var height_calc_button2: Int
    @Binding var selcolor: Color
    @Binding var selcolor2: Color
    @Binding var selcolor3: Color
    @Binding var selcolor4: Color
    @Binding var round_btn2: Int
    @Binding var round_btn: CGFloat
    @Binding var font_size2: Int
    @Binding var font_size: CGFloat
    @Binding var shadow1: CGFloat
    @Binding var shadow1_2: Int
    @Binding var shadow_opacity_1: CGFloat
    @Binding var shadow_opacity_1_2: Int
    @Binding var shadow_pos_y: CGFloat
    @Binding var shadow_pos_x: CGFloat
    @Binding var shadow_pos_y_p: Int
    @Binding var shadow_pos_x_p: Int
    @Binding var grid_count: Int
    @Binding var symbols: [String]
    @Binding var width_border: CGFloat
    @Binding var color_border: Color
    @Binding var width_border1: Int
    @Binding var rotate_btn: CGFloat
    @Binding var shadow2: CGFloat
    @Binding var rotate_btn1: Int
    @Binding var hpt: UIImpactFeedbackGenerator.FeedbackStyle
    @Binding var sound: String
    @Binding var shadow2_2: Int
    @Binding var selcolor5: Color
    @State private var savedLayouts: [String: Layout] = [:]
    @State private var selectedLayout: Layout?
    @AppStorage("layoutName") var layoutName: String = ""
    @Binding var colorString: String
    @Binding var colorString2: String
    @Binding var colorString3: String
    @Binding var colorString4: String
    @Binding var colorString5: String
    @Binding var colorString6: String
    @Binding var round_btn12: CGFloat
    @Binding var round_btn12_2: Int
    @Binding var height_output_box: CGFloat
    @Binding var height_output_box2: Int
    @Binding var width_output_box: CGFloat
    @Binding var width_output_box2: Int
    @State private var importedLayout: Layout?
    @State private var showingFilePicker = false
    @Binding var spacing_outputbox: CGFloat
    @Binding var spacing_outputbox_down: CGFloat
    @Binding var spacing_grid_hor: CGFloat
    @Binding var spacing_grid_ver: CGFloat
    @Binding var spacing_outputbox_conv: Int
    @Binding var spacing_grid_hor_conv: Int
    @Binding var spacing_grid_ver_conv: Int
    @Binding var colorString7: String
    @Binding var uicolor: Color
    @Binding var fontName: String
    @AppStorage("ColorSwitch") var ColorSwitch = true
    @AppStorage("ShapeSwitch") var ShapeSwitch = true
    @AppStorage("GridSwitch") var GridSwitch = true
    var body: some View {
        List {
            Section(header: Text("Save Layout")) {
                HStack {
                    TextField("Layout Name", text: $layoutName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical)
                    
                    Button(action: saveLayout, label: {
                        Text("Save")
                    })
                }
            }
            
            Section(header: Text("Load Layout")) {
                ForEach(savedLayouts.sorted(by: { $0.key < $1.key }), id: \.key) { key, layout in
                    Button(action: {
                        applyLayout(layout)
                    }) {
                        Text(key)
                    }
                    .contextMenu {
                        Button(action: {
                            applyLayout(layout)
                        }) {
                            Text("Load Layout")
                            Image(systemName: "square.and.arrow.down")
                        }
                        Button(action: {
                            exportLayout(layout)
                        }) {
                            Text("Export Layout")
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }
                .onDelete { indexSet in
                    deleteLayouts(at: indexSet)
                }
            }
            
            Button("Import Layout") {
                            showingFilePicker.toggle()
                        }
                        .fileImporter(isPresented: $showingFilePicker, allowedContentTypes: [.json]) { result in
                            importLayout(from: result)
                        }
                        .sheet(item: $importedLayout) { layout in
                            Text("Imported Layout: \(String(describing: layout))")
                        }
            NavigationLink(destination: layoutopt(ColorSwitch: $ColorSwitch, ShapeSwitch: $ShapeSwitch, GridSwitch: $GridSwitch)) {
                Text("LayoutOptions")
            }
        }
        .onAppear(perform: loadSavedLayouts)
        .navigationTitle("Layouts")
    }
    private func colorToHexString(_ color: Color) -> String {
        let uiColor = UIColor(color)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", redInt, greenInt, blueInt)
    }
    
    private func hexStringToColor(_ hexString: String) -> Color {
        var formattedHexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if formattedHexString.hasPrefix("#") {
            formattedHexString.remove(at: formattedHexString.startIndex)
        }
        
        if formattedHexString.count != 6 {
            return .black
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: formattedHexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    private func convcolor() {
        colorString = colorToHexString(selcolor)
        colorString2 = colorToHexString(selcolor2)
        colorString3 = colorToHexString(selcolor3)
        colorString4 = colorToHexString(selcolor4)
        colorString5 = colorToHexString(color_border)
        colorString6 = colorToHexString(selcolor5)
        colorString7 = colorToHexString(uicolor)
    }
    
    private func convcolorback() {
        selcolor = hexStringToColor(colorString)
        selcolor2 = hexStringToColor(colorString2)
        selcolor3 = hexStringToColor(colorString3)
        selcolor4 = hexStringToColor(colorString4)
        color_border = hexStringToColor(colorString5)
        selcolor5 = hexStringToColor(colorString6)
        uicolor = hexStringToColor(colorString7)
    }
    private func exportLayout(_ layout: Layout) {
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        
        let fileURL = documentsDirectoryURL.appendingPathComponent("exportedLayout.json")
        
        do {
            let layoutData = try JSONEncoder().encode(layout)
            try layoutData.write(to: fileURL)
            
            let documentPicker = UIDocumentPickerViewController(url: fileURL, in: .exportToService)
            UIApplication.shared.windows.first?.rootViewController?.present(documentPicker, animated: true, completion: nil)
        } catch {
            print("Error exporting layout: \(error)")
        }
    }
    private func saveLayout() {
        convcolor()
        let layout = Layout(width_calc_button: width_calc_button,
                            height_calc_button: height_calc_button,
                            roundBtn: round_btn,
                            symbols: symbols,
                            grid_count: grid_count,
                            shadow1: shadow1,
                            shadow_pos_y: shadow_pos_y,
                            shadow_pos_x: shadow_pos_x,
                            width_border: width_border,
                            font_size: font_size,
                            shadow_opacity_1: shadow_opacity_1,
                            rotate_btn: rotate_btn,
                            color1: colorString,
                            color2: colorString2,
                            color3: colorString3,
                            color4: colorString4,
                            color5: colorString5,
                            color6: colorString6,
                            color7: colorString7,
                            sound: sound,
                            shadow2: shadow2,
                            round_btn_12: round_btn12,
                            width_box: width_output_box,
                            height_box: height_output_box,
                            grid_hor: spacing_grid_hor,
                            grid_ver: spacing_grid_ver,
                            grid_space: spacing_outputbox,
                            fontname: fontName)
        if let layoutData = try? JSONEncoder().encode(layout) {
            savedLayouts[layoutName] = try? JSONDecoder().decode(Layout.self, from: layoutData)
        }
        
        UserDefaults.standard.set(layout.symbols, forKey: "Symbols")
        saveLayoutsToFile()
        layoutName = ""
    }
    
    private func loadLayout(_ layout: Layout) {
        width_calc_button = layout.width_calc_button
        height_calc_button = layout.height_calc_button
        round_btn = layout.roundBtn
        symbols = layout.symbols
        grid_count = layout.grid_count
        shadow1 = layout.shadow1
        shadow_pos_y = layout.shadow_pos_y
        shadow_pos_x = layout.shadow_pos_x
        width_border = layout.width_border
        font_size = layout.font_size
        shadow_opacity_1 = layout.shadow_opacity_1
        rotate_btn = layout.rotate_btn
        shadow2 = layout.shadow2
        convcolorback()
        sound = layout.sound
        round_btn12 = layout.round_btn_12
        width_output_box = layout.width_box
        height_output_box = layout.height_box
        spacing_grid_hor = layout.grid_hor
        spacing_grid_ver = layout.grid_ver
        spacing_outputbox = layout.grid_space
        fontName = layout.fontname
    }
    private func importLayout(from result: Result<URL, Error>) {
            switch result {
            case .success(let url):
                do {
                    let data = try Data(contentsOf: url)
                    let importedLayout = try JSONDecoder().decode(Layout.self, from: data)

                    // Handle the imported layout
                    // ...
                } catch {
                    print("Error importing layout: \(error)")
                }

            case .failure(let error):
                print("Failed to import layout: \(error)")
            }
        }
    private func loadSavedLayouts() {
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        
        let fileURL = documentsDirectoryURL.appendingPathComponent("savedLayouts.json")
        
        do {
            let data = try Data(contentsOf: fileURL)
            savedLayouts = try JSONDecoder().decode([String: Layout].self, from: data)
        } catch {
            print("Error loading saved layouts: \(error)")
        }
    }
    
    private func saveLayoutsToFile() {
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        
        let fileURL = documentsDirectoryURL.appendingPathComponent("savedLayouts.json")
        
        do {
            let data = try JSONEncoder().encode(savedLayouts)
            try data.write(to: fileURL)
        } catch {
            print("Error saving layouts: \(error)")
        }
    }
    func applyLayout(_ layout: Layout) {
        if ShapeSwitch == true {
            width_calc_button = layout.width_calc_button
            height_calc_button = layout.height_calc_button
            round_btn = layout.roundBtn
            width_output_box = layout.width_box
            height_output_box = layout.height_box
            round_btn12 = layout.round_btn_12
            rotate_btn = layout.rotate_btn
            font_size = layout.font_size
            shadow1 = layout.shadow1
            shadow_pos_y = layout.shadow_pos_y
            shadow_pos_x = layout.shadow_pos_x
            width_border = layout.width_border
            shadow2 = layout.shadow2
            fontName = layout.fontname
            width_output_box2 = Int(width_output_box)
            height_output_box2 = Int(height_output_box)
        }
        if GridSwitch == true {
            symbols = layout.symbols
            grid_count = layout.grid_count
            spacing_grid_hor = layout.grid_hor
            spacing_grid_ver = layout.grid_ver
            spacing_outputbox = layout.grid_space
        }
        if ColorSwitch == true {
            shadow_opacity_1 = layout.shadow_opacity_1
        }
        round_btn2 = Int(round_btn)
        font_size2 = Int(font_size)
        width_calc_button2 = Int(width_calc_button)
        height_calc_button2 = Int(height_calc_button)
        shadow1_2 = Int(shadow1)
        shadow_opacity_1_2 = Int(shadow_opacity_1)
        shadow_pos_x_p = Int(shadow_pos_x)
        shadow_pos_y_p = Int(shadow_pos_y)
        width_border1 = Int(width_border)
        rotate_btn1 = Int(rotate_btn)
        shadow2_2 = Int(shadow2)
        round_btn12_2 = Int(round_btn12)
        spacing_outputbox_conv = Int(spacing_outputbox)
        spacing_grid_hor_conv = Int(spacing_grid_hor)
        spacing_grid_ver_conv = Int(spacing_grid_ver)
        if ColorSwitch == true {
            colorString = layout.color1
            colorString2 = layout.color2
            colorString3 = layout.color3
            colorString4 = layout.color4
            colorString5 = layout.color5
            colorString6 = layout.color6
            colorString7 = layout.color7
            convcolorback()
        }
        sound = layout.sound
        UserDefaults.standard.set(symbols, forKey: "Symbols")
        UserDefaults.standard.set(grid_count, forKey: "grid_count")
        
        // Update other variables with the corresponding values from the layout
        // ...
    }
    private func deleteLayouts(at offsets: IndexSet) {
        let indicesToRemove = Array(offsets)
        let layoutKeys = savedLayouts.keys.sorted()
        
        var updatedLayouts: [String: Layout] = [:]
        
        for (index, key) in layoutKeys.enumerated() {
            if !indicesToRemove.contains(index) {
                updatedLayouts[key] = savedLayouts[key]
            }
        }
        
        savedLayouts = updatedLayouts
        saveLayoutsToFile()
    }
}

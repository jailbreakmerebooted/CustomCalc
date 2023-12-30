import SwiftUI
import MobileCoreServices
import UniformTypeIdentifiers

struct Layout: Codable, Identifiable, Equatable {
    let id = UUID() // Unique identifier for the layout
    var width_calc_button: CGFloat?
    var height_calc_button: CGFloat?
    var roundBtn: CGFloat?
    var symbols: [String]?
    var grid_count: Int?
    var shadow1: CGFloat?
    var shadow_pos_y: CGFloat?
    var shadow_pos_x: CGFloat?
    var width_border: CGFloat?
    var font_size: CGFloat?
    var shadow_opacity_1: CGFloat?
    var rotate_btn: CGFloat?
    var color1: String?
    var color2: String?
    var color3: String?
    var color4: String?
    var color5: String?
    var color6: String?
    var color7: String?
    var sound: String?
    var shadow2: CGFloat?
    var round_btn_12: CGFloat?
    var width_box : CGFloat?
    var height_box: CGFloat?
    var grid_hor: CGFloat?
    var grid_ver: CGFloat?
    var grid_space: CGFloat?
    var fontname: String?
    var emo1: String?
    var sm1: Int?
    var sm2: Int?
    var sm3: Int?
    var font_size2_1: CGFloat?
    var xemo: CGFloat?
    var yemo: CGFloat?
    var font_size3: CGFloat?
    var layoutname: String?
    var tab1: String?
    var tab2: String?
    var tab3: String?
    var tab4: String?
    var rotation: Double?
    var fontName2: String?
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
    @Binding var selectedEmoji: String
    @Binding var gesturefield1: Int
    @Binding var gesturefield2: Int
    @Binding var gesturefield3: Int
    @Binding var font_size2_1: CGFloat
    @Binding var font_size2_2: Int
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    @Binding var offsetx: Int
    @Binding var offsety: Int
    @Binding var font_size3: CGFloat
    @Binding var font_size3_2: Int
    @State private var isImporting: Bool = false
    @State private var layoutpreview: Int = 0
    @State private var delh: Bool = false
    @Binding var tabbar1: String
    @Binding var tabbar2: String
    @Binding var tabbar3: String
    @Binding var tabbar4: String
    @Binding var rotation: Double
    @Binding var fontName2: String
    
    //preview_vals
    @State private var h1: CGFloat = 0.0
    @State private var h2: CGFloat = 0.0
    @State private var h3: CGFloat = 0.0
    @State private var h4: CGFloat = 0.0
    @State private var h5: CGFloat = 0.0
    @State private var h6: CGFloat = 0.0
    @State private var h7: CGFloat = 0.0
    @State private var h8: CGFloat = 0.0
    @State private var h9: CGFloat = 0.0
    @State private var h10: CGFloat = 0.0
    @State private var h11: CGFloat = 0.0
    @State private var h12: String = ""
    @State private var h13: String = ""
    
    @State private var c1: String = ""
    @State private var c2: String = ""
    @State private var c3: String = ""
    @State private var c4: String = ""
    @State private var c5: String = ""
    @State private var c6: String = ""
    @State private var c7: String = ""
    @State private var cs1: Color = Color.black
    @State private var cs2: Color = Color.black
    @State private var cs3: Color = Color.black
    @State private var cs4: Color = Color.black
    @State private var cs5: Color = Color.black
    @State private var cs6: Color = Color.black
    @State private var cs7: Color = Color.black
    
    @State private var h14: CGFloat = 0.0
    @State private var h15: CGFloat = 0.0
    @State private var h16: String = ""
    @State private var h17: CGFloat = 0.0
    @State private var h18: CGFloat = 0.0
    @State private var h19: String = ""
    @State private var h20: String = ""
    @State private var h21: String = ""
    @State private var h22: [String] = []
    @State private var h23: String = ""
    @State private var h24: Double = 0.0
    @State private var h25: String = "Gill Sans"
    @State private var h26: String = "Gill Sans"
    @State private var h27: Int = 0
    @State private var h28: Int = 0
    
    @State private var keycolor: Color = Color.blue
    var body: some View {
        ZStack {
            if layoutpreview == 0 {
                VStack {
                    List {
                        Section(header: Text("Save Layout")) {
                            HStack {
                                TextField("  Layout Name", text: $layoutName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(height: 35)
                                
                                Button("Save") {
                                    saveLayout()
                                }
                                .frame(width: 60, height: 33)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                            }
                            .frame(height: 50)
                        }
                            Section(header: Text("Load Layout")) {
                            ForEach(savedLayouts.sorted(by: { $0.key < $1.key }), id: \.key) { key, layout in
                                Button(action: {
                                    applyLayout(layout)
                                }) {
                                    Text(key)
                                        .foregroundColor(.primary)
                                }
                                .contextMenu {
                                    Button(action: {
                                        applypreview(layout)
                                        layoutpreview = 1
                                    } ) {
                                        Label("Info", systemImage: "info")
                                    }
                                    Section() {
                                        Button(action: {
                                            applycolor(layout)
                                        }) {
                                            Label("Apply Color", systemImage: "slowmo")
                                        }
                                        Button(action: {
                                            applyshape(layout)
                                        }) {
                                            Label("Apply Shape", systemImage: "slowmo")
                                        }
                                        Button(action: {
                                            applygrid(layout)
                                        }) {
                                            Label("Apply Grid", systemImage: "slowmo")
                                        }
                            
                                    }
                                    Section {
                                        Button(action: {
                                            renameLayout(layout)
                                        }) {
                                            Label("Rename", systemImage: "pencil")
                                        }
                                        Button(action: {
                                            exportLayout(layout)
                                        }) {
                                            Label("Share", systemImage: "square.and.arrow.up")
                                        }
                                        Button(role: .destructive) {
                                            deleteLayout(layout)
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                deleteLayouts(at: indexSet)
                            }
                        }
                        Button(action: {
                            isImporting = true
                        }) {
                            Label("Import Layout", systemImage: "square.and.arrow.down")
                        }
                    }
                    .onAppear(perform: loadSavedLayouts)
                    .onAppear()
                    .fileImporter(isPresented: $isImporting, allowedContentTypes: [.json]) { result in
                        switch result {
                        case .success(let selectedURL):
                            print("Selected URL: \(selectedURL)")
                            
                            // Check if the file exists
                            if FileManager.default.fileExists(atPath: selectedURL.path) {
                                do {
                                    // Read the file data
                                    let layoutData = try Data(contentsOf: selectedURL)
                                    let layout = try JSONDecoder().decode(Layout.self, from: layoutData)
                                    
                                    // Process the layout data
                                    self.width_calc_button = layout.width_calc_button ?? 0
                                    self.height_calc_button = layout.height_calc_button ?? 0
                                    self.round_btn = layout.roundBtn ?? 0
                                    self.symbols = layout.symbols ?? []
                                    self.grid_count = layout.grid_count ?? 0
                                    self.shadow1 = layout.shadow1 ?? 0.0
                                    self.shadow_pos_y = layout.shadow_pos_y ?? 0.0
                                    self.shadow_pos_x = layout.shadow_pos_x ?? 0.0
                                    self.width_border = layout.width_border ?? 0.0
                                    self.font_size = layout.font_size ?? 0.0
                                    self.shadow_opacity_1 = layout.shadow_opacity_1 ?? 0.0
                                    self.rotate_btn = layout.rotate_btn ?? 0.0
                                    self.colorString = layout.color1 ?? ""
                                    self.colorString2 = layout.color2 ?? ""
                                    self.colorString3 = layout.color3 ?? ""
                                    self.colorString4 = layout.color4 ?? ""
                                    self.colorString5 = layout.color5 ?? ""
                                    self.colorString6 = layout.color6 ?? ""
                                    self.colorString7 = layout.color7 ?? ""
                                    self.sound = layout.sound ?? ""
                                    self.shadow2 = layout.shadow2 ?? 0.0
                                    self.round_btn12 = layout.round_btn_12 ?? 0.0
                                    self.width_output_box = layout.width_box ?? 0.0
                                    self.height_output_box = layout.height_box ?? 0.0
                                    self.spacing_grid_hor = layout.grid_hor ?? 0.0
                                    self.spacing_grid_ver = layout.grid_ver ?? 0.0
                                    self.spacing_outputbox = layout.grid_space ?? 0.0
                                    self.fontName = layout.fontname ?? ""
                                    self.selectedEmoji = layout.emo1 ?? ""
                                    self.gesturefield1 = layout.sm1 ?? 0
                                    self.gesturefield2 = layout.sm2 ?? 0
                                    self.gesturefield3 = layout.sm3 ?? 0
                                    self.font_size2_1 = layout.font_size2_1 ?? 0.0
                                    self.xemo = layout.xemo ?? 0.0
                                    self.yemo = layout.yemo ?? 0.0
                                    self.font_size3 = layout.font_size3 ?? 0.0
                                    self.layoutName = layout.layoutname ?? "Unknown"
                                    convcolorback()
                                    saveLayout()
                                } catch {
                                    print("Error importing layout: \(error)")
                                }
                            } else {
                                // Handle the case when the file doesn't exist
                                print("The file doesn't exist.")
                                // Display an error message or take appropriate action
                            }
                        case .failure(let error):
                            print("Error selecting file: \(error)")
                        }
                        
                        isImporting = false
                    }
                    .navigationTitle("Layouts")
                }
            }
            if layoutpreview == 1 {
                List {
                    Section(header: Text("Preview")) {
                        ZStack {
                            Rectangle()
                                .opacity(0)
                                .frame(height: 250)
                                .overlay {
                                    VStack {
                                        if layoutpreview == 1 {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(cs3)
                                                    .frame(width: 350, height: 200)
                                                    .cornerRadius(20)
                                                    .animation(.spring())
                                                ZStack {
                                                    Rectangle()
                                                        .frame(width: h2, height: h1)
                                                        .cornerRadius(h4)
                                                        .shadow(color: cs4.opacity(h14), radius: h8, x: h10, y: h9)
                                                        .foregroundColor(cs5)
                                                        .rotationEffect(Angle(degrees: h6))
                                                    Text("")
                                                        .frame(width: h2 - h3, height: h1 - h3)
                                                        .background(cs1)
                                                        .foregroundColor(cs2)
                                                        .cornerRadius(h4)
                                                        .rotationEffect(Angle(degrees: h6))
                                                    Text(h13)
                                                        .font(.system(size: h15))
                                                        .offset(x: h17, y: h18)
                                                        .rotationEffect(Angle(degrees: h6))
                                                    Text("0")
                                                        .foregroundColor(cs2)
                                                        .font(.custom(h19, size: h7))
                                                        .rotationEffect(Angle(degrees: h6 + h5))
                                                        .shadow(color: cs6.opacity(h14), radius: h11, x: 0, y: 0)
                                                }
                                                .rotation3DEffect(
                                                                Angle(degrees: h24),
                                                                axis: (x: 0, y: 1, z: 0) // Rotate around the Y-axis
                                                            )
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    .listRowBackground(cs3)
                    Section(header: Text("Main")) {
                        Text("Name: \(h21)")
                        Text("Grid: \(h28) x \(h27)")
                        Text("Symbols in grid: \(h23)")
                    }
                    Section(header: Text("Color")) {
                        color_preview(text: "Background", color: $cs3)
                        color_preview(text: "Module Background", color: $cs1)
                        color_preview(text: "Text", color: $cs2)
                        color_preview(text: "Text Shadow", color: $cs6)
                        color_preview(text: "Shadow", color: $cs4)
                        color_preview(text: "Border", color: $cs5)
                        color_preview(text: "UI", color: $uicolor)
                    }
                    .onAppear {
                                            let joinedSymbols = h22.joined(separator: ", ")
                                            h23 = joinedSymbols
                                        }
                }
                .navigationTitle("Info")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(trailing:
                                        Button(action: {
                    layoutpreview = 0
                }) {
                    Image(systemName: "xmark.circle")
                }
            )
            }
        }
    }
    private func renameLayout(_ layout: Layout) {
        let alertController = UIAlertController(title: "Rename Layout", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter new name"
            textField.text = layout.layoutname // Pre-fill the current name
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let renameAction = UIAlertAction(title: "Rename", style: .default) { [self, alertController] _ in
            guard let newName = alertController.textFields?.first?.text else { return }
            self.updateLayoutName(layout, newName: newName)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(renameAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    private func updateLayoutName(_ layout: Layout, newName: String) {
        if let existingLayout = savedLayouts.removeValue(forKey: layout.layoutname ?? "") {
            var updatedLayout = layout
            updatedLayout.layoutname = newName
            savedLayouts[newName] = updatedLayout
            saveSavedLayouts()
        }
    }
    private func saveSavedLayouts() {
        // Save the updated savedLayouts dictionary
        guard let saveURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("savedLayouts.json") else {
            print("Error accessing save file.")
            return
        }
        
        do {
            let saveData = try JSONEncoder().encode(savedLayouts)
            try saveData.write(to: saveURL)
            print("Saved layouts updated successfully.")
        } catch {
            print("Error updating saved layouts: \(error)")
        }
    }
    func handleImportedLayout(_ layout: Layout) {
        // Access the properties of the imported layout and perform any necessary actions
        
        // Example: Print the values of some properties
        print("Imported Layout:")
        print("Width Calculation Button: \(layout.width_calc_button ?? 0)")
        print("Height Calculation Button: \(layout.height_calc_button ?? 0)")
        print("Round Button: \(layout.roundBtn ?? 0)")
        // ...
        
        // Example: Update the UI based on the imported layout
        
        // Assuming you have a reference to a view that needs to be updated
        self.width_calc_button = layout.width_calc_button ?? 0
        self.height_calc_button = layout.height_calc_button ?? 0
        self.round_btn = layout.roundBtn ?? 0
        self.colorString = layout.color1 ?? ""
        self.colorString2 = layout.color2 ?? ""
        self.colorString3 = layout.color3 ?? ""
        self.colorString4 = layout.color4 ?? ""
        self.colorString5 = layout.color5 ?? ""
        self.colorString6 = layout.color6 ?? ""
        self.colorString7 = layout.color7 ?? ""
        // ...
        // ...
        
        // Example: Update the save file with the imported layout
        
        // Load the existing save file
        guard let saveURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("savedLayouts.json") else {
            print("Error accessing save file.")
            return
        }
        
        var savedLayouts: [Layout]
        
        do {
            let saveData = try Data(contentsOf: saveURL)
            savedLayouts = try JSONDecoder().decode([Layout].self, from: saveData)
        } catch {
            print("Error loading save file: \(error)")
            savedLayouts = []
        }
        
        // Add the imported layout to the existing save file
        savedLayouts.append(layout)
        
        // Save the updated layout back to the file
        do {
            let updatedSaveData = try JSONEncoder().encode(savedLayouts)
            try updatedSaveData.write(to: saveURL)
            print("Save file updated successfully.")
        } catch {
            print("Error updating save file: \(error)")
        }
    }
    func loadExportedLayoutFile() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Unable to access the documents directory.")
            return
        }
        
        let fileURL = documentsDirectory.appendingPathComponent("exportedLayout.json")
        
        do {
            let layoutData = try Data(contentsOf: fileURL)
            let importedLayout = try JSONDecoder().decode(Layout.self, from: layoutData)
            
            // Handle the imported layout
            handleImportedLayout(importedLayout)
            
        } catch {
            print("Error importing layout: \(error)")
        }
    }
    func readFileFromDocumentsDirectory() {
        let fileName = "example.txt"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(fileName)
            
            do {
                let contents = try String(contentsOf: fileURL, encoding: .utf8)
                print(contents)
            } catch {
                print("Error reading file: \(error)")
            }
        }
    }
    private func exportLayout(_ layout: Layout) {
        do {
            let layoutData = try JSONEncoder().encode(layout)
            let temporaryURL = FileManager.default.temporaryDirectory.appendingPathComponent("exportedLayout.json")
            try layoutData.write(to: temporaryURL)
            
            let activityViewController = UIActivityViewController(activityItems: [temporaryURL], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
        } catch {
            print("Error exporting layout: \(error)")
        }
    }
    private func colorToRGBString(_ color: Color) -> String {
        let uiColor = UIColor(color)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        
        return "\(redInt),\(greenInt),\(blueInt)"
    }
    
    private func RGBStringToColor(_ rgbString: String) -> Color {
        let components = rgbString.components(separatedBy: ",").compactMap { Int($0) }
        guard components.count == 3 else {
            return .black
        }
        
        let red = Double(components[0]) / 255.0
        let green = Double(components[1]) / 255.0
        let blue = Double(components[2]) / 255.0
        
        return Color(red: red, green: green, blue: blue)
    }
    private func convcolor() {
        colorString = colorToRGBString(selcolor)
        colorString2 = colorToRGBString(selcolor2)
        colorString3 = colorToRGBString(selcolor3)
        colorString4 = colorToRGBString(selcolor4)
        colorString5 = colorToRGBString(color_border)
        colorString6 = colorToRGBString(selcolor5)
        colorString7 = colorToRGBString(uicolor)
    }
    
    private func convcolorback() {
        selcolor = RGBStringToColor(colorString)
        selcolor2 = RGBStringToColor(colorString2)
        selcolor3 = RGBStringToColor(colorString3)
        selcolor4 = RGBStringToColor(colorString4)
        selcolor5 = RGBStringToColor(colorString6)
        color_border = RGBStringToColor(colorString5)
        uicolor = RGBStringToColor(colorString7)
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
                            fontname: fontName,
                            emo1: selectedEmoji,
                            sm1: gesturefield1,
                            sm2: gesturefield2,
                            sm3: gesturefield3,
                            font_size2_1: font_size2_1,
                            xemo: xemo,
                            yemo: yemo,
                            font_size3: font_size3,
                            layoutname: layoutName,
                            tab1: tabbar1,
                            tab2: tabbar2,
                            tab3: tabbar3,
                            tab4: tabbar4,
                            rotation: rotation,
                            fontName2: fontName2)
        if let layoutData = try? JSONEncoder().encode(layout) {
            savedLayouts[layoutName] = try? JSONDecoder().decode(Layout.self, from: layoutData)
        }
        
        UserDefaults.standard.set(layout.symbols, forKey: "Symbols")
        saveLayoutsToFile()
        layoutName = ""
    }
    
    private func loadLayout(_ layout: Layout) {
        width_calc_button = layout.width_calc_button ?? 0
        height_calc_button = layout.height_calc_button ?? 0
        round_btn = layout.roundBtn ?? 0
        symbols = layout.symbols ?? [""]
        grid_count = layout.grid_count ?? 0
        shadow1 = layout.shadow1 ?? 0.0
        shadow_pos_y = layout.shadow_pos_y ?? 0
        shadow_pos_x = layout.shadow_pos_x ?? 0
        width_border = layout.width_border ?? 0
        font_size = layout.font_size ?? 0
        shadow_opacity_1 = layout.shadow_opacity_1 ?? 0
        rotate_btn = layout.rotate_btn ?? 0
        shadow2 = layout.shadow2 ?? 0.0
        convcolorback()
        sound = layout.sound ?? ""
        round_btn12 = layout.round_btn_12 ?? 0
        width_output_box = layout.width_box ?? 0
        height_output_box = layout.height_box ?? 0
        spacing_grid_hor = layout.grid_hor ?? 0
        spacing_grid_ver = layout.grid_ver ?? 0
        spacing_outputbox = layout.grid_space ?? 0
        fontName = layout.fontname ?? ""
        selectedEmoji = layout.emo1 ?? ""
        gesturefield1 = layout.sm1 ?? 0
        gesturefield2 = layout.sm2 ?? 0
        gesturefield3 = layout.sm3 ?? 0
        font_size2_1 = layout.font_size2_1 ?? 0
        xemo = layout.xemo ?? 0
        yemo = layout.yemo ?? 0
        font_size3 = layout.font_size3 ?? 10.0
        layoutName = layout.layoutname ?? "Unknown"
        tabbar1 = layout.tab1 ?? ""
        tabbar2 = layout.tab2 ?? ""
        tabbar3 = layout.tab3 ?? ""
        tabbar4 = layout.tab4 ?? ""
        rotation = layout.rotation ?? 0.0
        fontName2 = layout.fontName2 ?? "Gill Sans"
    }
    func importLayout(layout: Layout) -> Data? {
        do {
            let jsonData = try JSONEncoder().encode(layout)
            return jsonData
        } catch {
            print("Error encoding layout: \(error)")
            return nil
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
    func applypreview(_ layout: Layout) {
        h1 = layout.height_calc_button ?? 0.0 //done
        h2 = layout.width_calc_button ?? 0.0 //done
        h3 = layout.width_border ?? 0.0 //done
        h4 = layout.roundBtn ?? 0.0 //done
        h5 = layout.round_btn_12 ?? 0.0 //done
        h6 = layout.rotate_btn ?? 0.0 //done
        h7 = layout.font_size ?? 0.0 //done
        h8 = layout.shadow1 ?? 0.0 //done
        h9 = layout.shadow_pos_y ?? 0.0 //done
        h10 = layout.shadow_pos_x ?? 0.0 //done
        h11 = layout.shadow2 ?? 0.0 //done
        h12 = layout.fontname ?? ""
        h13 = layout.emo1 ?? ""
        h14 = layout.shadow_opacity_1 ?? 0.0
        h15 = layout.font_size2_1 ?? 0.0
        h17 = layout.xemo ?? 0.0
        h18 = layout.yemo ?? 0.0
        h19 = layout.fontname ?? ""
        h21 = layout.layoutname ?? "Unknown"
        h22 = layout.symbols ?? []
        h24 = layout.rotation ?? 0.0
        h25 = layout.fontname ?? "Gill Sans"
        h26 = layout.fontName2 ?? "Gill Sans"
        h27 = layout.grid_count ?? 0
        h28 = calculateRowCount(spacesInRow: h27, totalSpaces: h22.count)
        
        c1 = layout.color1 ?? ""
        c2 = layout.color2 ?? ""
        c3 = layout.color3 ?? ""
        c4 = layout.color4 ?? ""
        c5 = layout.color5 ?? ""
        c6 = layout.color6 ?? ""
        cs1 = RGBStringToColor(c1)
        cs2 = RGBStringToColor(c2)
        cs3 = RGBStringToColor(c3)
        cs4 = RGBStringToColor(c4)
        cs5 = RGBStringToColor(c5)
        cs6 = RGBStringToColor(c6)
    }
    func applycolor(_ layout: Layout) {
        colorString = layout.color1 ?? ""
        colorString2 = layout.color2 ?? ""
        colorString3 = layout.color3 ?? ""
        colorString4 = layout.color4 ?? ""
        colorString5 = layout.color5 ?? ""
        colorString6 = layout.color6 ?? ""
        colorString7 = layout.color7 ?? ""
        convcolorback()
    }
    func applyshape(_ layout: Layout) {
        width_calc_button = layout.width_calc_button ?? 0.0
        height_calc_button = layout.height_calc_button ?? 0.0
        round_btn = layout.roundBtn ?? 0.0
        width_output_box = layout.width_box ?? 0.0
        height_output_box = layout.height_box ?? 0.0
        round_btn12 = layout.round_btn_12 ?? 0.0
        rotate_btn = layout.rotate_btn ?? 0.0
        font_size = layout.font_size ?? 0.0
        shadow1 = layout.shadow1 ?? 0.0
        shadow_pos_y = layout.shadow_pos_y ?? 0.0
        shadow_pos_x = layout.shadow_pos_x ?? 0.0
        width_border = layout.width_border ?? 0.0
        shadow2 = layout.shadow2 ?? 0.0
        fontName = layout.fontname ?? "Arial"
        selectedEmoji = layout.emo1 ?? ""
        gesturefield1 = layout.sm1 ?? 0
        gesturefield2 = layout.sm2 ?? 0
        gesturefield3 = layout.sm3 ?? 0
        font_size3 = layout.font_size3 ?? 0.0
        shadow_opacity_1 = layout.shadow_opacity_1 ?? 0.0
    }
    func applygrid(_ layout: Layout) {
        symbols = layout.symbols ?? []
        grid_count = layout.grid_count ?? 0
        spacing_grid_hor = layout.grid_hor ?? 0.0
        spacing_grid_ver = layout.grid_ver ?? 0.0
        spacing_outputbox = layout.grid_space ?? 0.0
    }
    func applyLayout(_ layout: Layout) {
            width_calc_button = layout.width_calc_button ?? 0.0
            height_calc_button = layout.height_calc_button ?? 0.0
            round_btn = layout.roundBtn ?? 0.0
            width_output_box = layout.width_box ?? 0.0
            height_output_box = layout.height_box ?? 0.0
            round_btn12 = layout.round_btn_12 ?? 0.0
            rotate_btn = layout.rotate_btn ?? 0.0
            font_size = layout.font_size ?? 0.0
            shadow1 = layout.shadow1 ?? 0.0
            shadow_pos_y = layout.shadow_pos_y ?? 0.0
            shadow_pos_x = layout.shadow_pos_x ?? 0.0
            width_border = layout.width_border ?? 0.0
            shadow2 = layout.shadow2 ?? 0.0
            fontName = layout.fontname ?? "Arial"
            selectedEmoji = layout.emo1 ?? ""
            gesturefield1 = layout.sm1 ?? 0
            gesturefield2 = layout.sm2 ?? 0
            gesturefield3 = layout.sm3 ?? 0
            font_size3 = layout.font_size3 ?? 0.0
            shadow_opacity_1 = layout.shadow_opacity_1 ?? 0.0
            symbols = layout.symbols ?? []
            grid_count = layout.grid_count ?? 0
            spacing_grid_hor = layout.grid_hor ?? 0.0
            spacing_grid_ver = layout.grid_ver ?? 0.0
            spacing_outputbox = layout.grid_space ?? 0.0
            colorString = layout.color1 ?? ""
            colorString2 = layout.color2 ?? ""
            colorString3 = layout.color3 ?? ""
            colorString4 = layout.color4 ?? ""
            colorString5 = layout.color5 ?? ""
            colorString6 = layout.color6 ?? ""
            colorString7 = layout.color7 ?? ""
            convcolorback()
            font_size2_1 = layout.font_size2_1 ?? 0.0
            xemo = layout.xemo ?? 0.0
            yemo = layout.yemo ?? 0.0
            tabbar1 = layout.tab1 ?? "plus.slash.minus"
            tabbar2 = layout.tab2 ?? "clock.arrow.circlepath"
            tabbar3 = layout.tab3 ?? "pencil.and.outline"
            tabbar4 = layout.tab4 ?? "slider.horizontal.3"
            rotation = layout.rotation ?? 0.0
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
        font_size2_2 = Int(font_size2_1)
        offsetx = Int(xemo)
        offsety = Int(yemo)
        font_size3_2 = Int(font_size3)
        
        // Set the values in UserDefaults
        UserDefaults.standard.set(symbols, forKey: "Symbols")
        UserDefaults.standard.set(grid_count, forKey: "grid_count")
        
        // Update other variables with the corresponding values from the layout
        // ...
    }
    func calculateRowCount(spacesInRow: Int, totalSpaces: Int) -> Int {
        guard spacesInRow > 0 && totalSpaces > 0 else {
            // Handle invalid input
            return 0
        }

        let rowCount = totalSpaces / spacesInRow
        let remainingSpaces = totalSpaces % spacesInRow

        return rowCount + (remainingSpaces > 0 ? 1 : 0)
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
    private func deleteLayout(_ layout: Layout) {
        if let key = savedLayouts.first(where: { $0.value == layout })?.key {
            savedLayouts[key] = nil
            saveLayoutsToFile()
        }
    }
}

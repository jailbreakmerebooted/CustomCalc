import SwiftUI
import AVFoundation

enum CalculatorOperation {
    case none, add, subtract, multiply, divide, squareRoot
}

struct Calculator: View {
    @State var deviceHeight = UIScreen.main.bounds.height
    @State var deviceWidth = UIScreen.main.bounds.width
    @AppStorage("used") var used: Bool = false
    @AppStorage("Update_fix0_5") var Update_fix0_5: Bool = true
    @StateObject var player = MusicPlayer()
    @State private var enteredNumber = ""
    @State private var currentOperation: CalculatorOperation = .none
    @State private var previousNumber = 0.0
    @State private var outputText = ""
    @State private var output = "0"
    @State private var previousResult: Double = 0.0
    @State private var lastEnteredNumber: Double = 0.0
    @State private var lastOperation: CalculatorOperation = .none
    @State private var testingshit: CGFloat = 1000
    @State private var started = true
    @State private var used2 = false
    @State private var offset: CGFloat = 0.0
    @State private var offset2: CGFloat = 0.0
    @State private var numblend: CGFloat = 1.0
    @State private var buttonScale: CGFloat = 1.0
    @State private var laststringoperation: String = ""
    @State private var dragOverIndex: Int?
    @State private var isButtonPressed = false
    @State private var orientation: UIDeviceOrientation? = UIDevice.current.orientation
    @State var jujuj: Bool = false
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
    @Binding var rotate_btn1: Int
    @Binding var shadow2: CGFloat
    @Binding var shadow2_2: Int
    @Binding var hpt: UIImpactFeedbackGenerator.FeedbackStyle
    @Binding var sound: String
    @Binding var selcolor5: Color
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
    @Binding var gesture: Int
    @Binding var font_size2_1: CGFloat
    @Binding var font_size2_2: Int
    @Binding var xemo: CGFloat
    @Binding var yemo: CGFloat
    @Binding var offsetx: Int
    @Binding var offsety: Int
    @Binding var font_size3: CGFloat
    @Binding var font_size3_2: Int
    @Binding var fontName2: String
    @Binding var tabbar1: String
    @Binding var tabbar2: String
    @Binding var tabbar3: String
    @Binding var tabbar4: String
    @Binding var cph: [String]
    @Binding var coph: [String]
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 3040)
                        .foregroundColor(selcolor3)
                    
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: width_output_box, height: height_output_box)
                                .cornerRadius(round_btn)
                                .foregroundColor(selcolor)
                                .shadow(color: selcolor4.opacity(shadow_opacity_1), radius: shadow1, x: shadow_pos_x, y: shadow_pos_y)
                            VStack {
                                Text(outputText)
                                    .font(.system(size: font_size3))
                                    .opacity(numblend)
                                    .foregroundColor(selcolor2)
                                    .frame(width: width_output_box-15, height: height_output_box-10)
                                    
                                    .shadow(color: selcolor5.opacity(shadow_opacity_1), radius: shadow2, x: 0, y: 0)
                            }
                            .frame(height: height_output_box)
                        }
                    }
                    .onTapGesture {
                        UIPasteboard.general.string = enteredNumber
                                    
                                    // Optionally, you can show a success message using an alert
                                    let alert = UIAlertController(title: "Copied", message: "Text copied to clipboard", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                    }
                    .offset(x: offset, y: 0)
                                .gesture(
                                    DragGesture()
                                        .onChanged { gesture in
                                            if gesturefield1 > 0 {
                                                if gesture.translation.width < 0 {
                                                    self.offset = gesture.translation.width
                                                }
                                            }
                                            
                                            if gesturefield2 > 0 {
                                                if gesture.translation.width > 0 {
                                                    self.offset = gesture.translation.width
                                                }
                                            }
                                        }
                                        .onEnded { gesture in
                                            if gesturefield1 > 0 {
                                                if gesture.translation.width < -30 {
                                                    if gesturefield1 == 1 {
                                                        calcgestures()
                                                    } else if gesturefield1 == 2 {
                                                        calcgesture2()
                                                    }
                                                }
                                            }
                                            if gesturefield2 > 0 {
                                                if gesture.translation.width > 30 {
                                                    if gesturefield2 == 1 {
                                                        calcgestures()
                                                    } else if gesturefield2 == 2 {
                                                        calcgesture2()
                                                    }
                                                }
                                            }
                                            withAnimation {
                                                self.offset = 0
                                            }
                                            
                                        }
                                )
                             Rectangle()
                            .opacity(0)
                            .frame(height: spacing_outputbox)
                    VStack {
                        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: grid_count)
                    
                        LazyVGrid(columns: columns, spacing: spacing_grid_hor) {
                            ForEach(symbols, id: \.self) { symbol in
                                Button(action: {
                                    buttonPressed(symbol)
                                    triggerHapticFeedback()
                                    if sound != "" {
                                        player.loadMusic(name: sound)
                                        player.play()
                                    }
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: width_calc_button, height: height_calc_button)
                                            .cornerRadius(round_btn)
                                            .shadow(color: selcolor4.opacity(shadow_opacity_1), radius: shadow1, x: shadow_pos_x, y: shadow_pos_y)
                                            .foregroundColor(color_border)
                                            .rotationEffect(Angle(degrees: rotate_btn))
                                        Text("")
                                            .frame(width: width_calc_button - width_border, height: height_calc_button - width_border)
                                            .background(selcolor)
                                            .foregroundColor(selcolor2)
                                            .cornerRadius(round_btn)
                                            .rotationEffect(Angle(degrees: rotate_btn))
                                        Text(selectedEmoji)
                                            .font(.system(size: font_size2_1))
                                            .offset(x: xemo, y: yemo)
                                            .rotationEffect(Angle(degrees: rotate_btn))
                                        Text(symbol)
                                            .foregroundColor(selcolor2)
                                            .font(.custom(fontName, size: font_size))
                                            .rotationEffect(Angle(degrees: rotate_btn + round_btn12))
                                            .shadow(color: selcolor5.opacity(shadow_opacity_1), radius: shadow2, x: 0, y: 0)
                                    }
                                }
                                .contentShape(Rectangle())
                                .onDrag {
                                    NSItemProvider(object: symbol as NSString)
                                }
                                .onDrop(of: [.text], isTargeted: nil) { providers in
                                    guard let item = providers.first else { return false }
                                    item.loadObject(ofClass: NSString.self) { (droppedSymbol, error) in
                                        guard let droppedSymbol = droppedSymbol as? String else { return }
                                        DispatchQueue.main.async {
                                            if let index = symbols.firstIndex(of: droppedSymbol),
                                               let droppedIndex = symbols.firstIndex(of: symbol) {
                                                symbols.swapAt(index, droppedIndex)
                                                UserDefaults.standard.set(symbols, forKey: "Symbols")
                                            }
                                        }
                                    }
                                    return true
                                }
                                
                              }
                            }
                            .frame(width: spacing_grid_ver)
                        Rectangle()
                            .opacity(0)
                            .frame(height: 40)
                        }
                    Rectangle()
                        .frame(height: 3000)
                        .foregroundColor(selcolor3)
                        .overlay {
                            List {
                                Text("TabViewBar")
                                Text("TabViewBar")
                                Text("tabViewBar")
                                Text("TabViewBar")
                                Text("TabViewBar")
                                Text("TabViewBar")
                                Text("TabViewBar")
                                Text("TabViewBar")
                                Text("TabViewBar")
                                Text("TabViewBar")

                            }
                            .opacity(0)
                        }
                }
                .background(selcolor3)
                //.frame(width: 3000, height: 3000) //width: 375
                .frame(width: deviceWidth, height: deviceHeight) //width: 375
                .cornerRadius(round_btn)
                .edgesIgnoringSafeArea(.all)
                .contextMenu {
                    Button("Settings") {
                        jujuj = true
                    }
                    Button("Twist") {
                        twist()
                    }
                }
                .sheet(isPresented: $jujuj) {
                    SettingsView(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, selcolor4: $selcolor4, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1, shadow1_2: $shadow1_2, shadow_opacity_1: $shadow_opacity_1, shadow_opacity_1_2: $shadow_opacity_1_2, shadow_pos_y: $shadow_pos_y, shadow_pos_x: $shadow_pos_x, shadow_pos_y_p: $shadow_pos_y_p, shadow_pos_x_p: $shadow_pos_x_p, grid_count: $grid_count, symbols: $symbols, width_border: $width_border, color_border: $color_border, width_border1: $width_border1, rotate_btn: $rotate_btn, rotate_btn1: $rotate_btn1, shadow2: $shadow2, shadow2_2: $shadow2_2, hpt: $hpt, sound: $sound, selcolor5: $selcolor5, colorString: $colorString, colorString2: $colorString2, colorString3: $colorString3, colorString4: $colorString4, colorString5: $colorString5, colorString6: $colorString6, round_btn12: $round_btn12, round_btn12_2: $round_btn12_2, height_output_box: $height_output_box, height_output_box2: $height_output_box2, width_output_box: $width_output_box, width_output_box2: $width_output_box2, spacing_outputbox: $spacing_outputbox, spacing_outputbox_down: $spacing_outputbox_down, spacing_grid_hor: $spacing_grid_hor, spacing_grid_ver: $spacing_grid_ver, spacing_outputbox_conv: $spacing_outputbox_conv, spacing_grid_hor_conv: $spacing_grid_hor_conv, spacing_grid_ver_conv: $spacing_grid_ver_conv, colorString7: $colorString7, uicolor: $uicolor, fontName: $fontName, selectedEmoji: $selectedEmoji, gesturefield1: $gesturefield1, gesturefield2: $gesturefield2, gesturefield3: $gesturefield3, gesture: $gesture, font_size2_1: $font_size2_1, font_size2_2: $font_size2_2, xemo: $xemo, yemo: $yemo, offsetx: $offsetx, offsety: $offsety, font_size3: $font_size3, font_size3_2: $font_size3_2, fontName2: $fontName2, tabbar1: $tabbar1, tabbar2: $tabbar2, tabbar3: $tabbar3, tabbar4: $tabbar4)
                        .onDisappear {
                            print(Update_fix0_5)
                            print(used2)
                            if Update_fix0_5 == true {
                                width_border = 10
                                width_calc_button = 75
                                height_calc_button = 75
                                spacing_grid_ver = 350
                                spacing_grid_hor = 10
                                width_output_box = 350
                                height_output_box = 75
                                shadow1 = 5
                                rotate_btn = 0
                                round_btn12 = 0
                                font_size = 20
                                font_size3 = 20
                                selcolor = Color.gray
                                selcolor2 = Color.white
                                selcolor3 = Color.gray
                                selcolor4 = Color.red
                                selcolor5 = Color.black
                                color_border = Color.red
                                Update_fix0_5 = false
                                used2 = true
                            }
                            if used2 == true {
                                round_btn2 = Int(round_btn)
                                font_size2 = Int(font_size)
                                width_calc_button2 = Int(width_calc_button)
                                height_calc_button2 = Int(height_calc_button)
                                width_output_box2 = Int(width_output_box)
                                height_output_box2 = Int(height_output_box)
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
                                font_size3_2 = Int(font_size3)
                                offsetx = Int(xemo)
                                offsety = Int(yemo)
                                convcolor()
                            }
                            let defaultSymbols = ["AC", "sin", "cos", "tan","√", "sin⁻¹", "cos⁻¹", "tan⁻¹","7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", ".", "=", "+"]
                            width_calc_button = CGFloat(width_calc_button2)
                            height_calc_button = CGFloat(height_calc_button2)
                            width_output_box = CGFloat(width_output_box2)
                            height_output_box = CGFloat(height_output_box2)
                            font_size = CGFloat(font_size2)
                            round_btn = CGFloat(round_btn2)
                            shadow1 = CGFloat(shadow1_2)
                            shadow_opacity_1 = CGFloat(shadow_opacity_1_2)
                            shadow_pos_x = CGFloat(shadow_pos_x_p)
                            shadow_pos_y = CGFloat(shadow_pos_y_p)
                            width_border = CGFloat(width_border1)
                            rotate_btn = CGFloat(rotate_btn1)
                            shadow2 = CGFloat(shadow2_2)
                            round_btn12 = CGFloat(round_btn12_2)
                            spacing_outputbox = CGFloat(spacing_outputbox_conv)
                            spacing_grid_hor = CGFloat(spacing_grid_hor_conv)
                            spacing_grid_ver = CGFloat(spacing_grid_ver_conv)
                            font_size2_1 = CGFloat(font_size2_2)
                            font_size3 = CGFloat(font_size3_2)
                            xemo = CGFloat(offsetx)
                            yemo = CGFloat(offsety)
                            used2 = true
                            if used == false {
                                convcolor()
                                UserDefaults.standard.set(defaultSymbols, forKey: "Symbols")
                                used = true
                            }
                            cph = UserDefaults.standard.stringArray(forKey: "cph") ?? []
                            coph = UserDefaults.standard.stringArray(forKey: "coph") ?? []
                            symbols = UserDefaults.standard.stringArray(forKey: "Symbols") ?? []
                            if started == false {
                                convcolor()
                            } else if started == true {
                                convcolorback()
                            }
                        }
                }
            }
        }
            .onAppear {
                print(Update_fix0_5)
                print(used2)
                if Update_fix0_5 == true {
                    width_border = 10
                    width_calc_button = 75
                    height_calc_button = 75
                    spacing_grid_ver = 350
                    spacing_grid_hor = 10
                    width_output_box = 350
                    height_output_box = 75
                    shadow1 = 5
                    rotate_btn = 0
                    round_btn12 = 0
                    font_size = 20
                    font_size3 = 20
                    selcolor = Color.gray
                    selcolor2 = Color.white
                    selcolor3 = Color.gray
                    selcolor4 = Color.red
                    selcolor5 = Color.black
                    color_border = Color.red
                    Update_fix0_5 = false
                    used2 = true
                }
                if used2 == true {
                    round_btn2 = Int(round_btn)
                    font_size2 = Int(font_size)
                    width_calc_button2 = Int(width_calc_button)
                    height_calc_button2 = Int(height_calc_button)
                    width_output_box2 = Int(width_output_box)
                    height_output_box2 = Int(height_output_box)
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
                    font_size3_2 = Int(font_size3)
                    offsetx = Int(xemo)
                    offsety = Int(yemo)
                    convcolor()
                }
                let defaultSymbols = ["AC", "sin", "cos", "tan","√", "sin⁻¹", "cos⁻¹", "tan⁻¹","7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", ".", "=", "+"]
                width_calc_button = CGFloat(width_calc_button2)
                height_calc_button = CGFloat(height_calc_button2)
                width_output_box = CGFloat(width_output_box2)
                height_output_box = CGFloat(height_output_box2)
                font_size = CGFloat(font_size2)
                round_btn = CGFloat(round_btn2)
                shadow1 = CGFloat(shadow1_2)
                shadow_opacity_1 = CGFloat(shadow_opacity_1_2)
                shadow_pos_x = CGFloat(shadow_pos_x_p)
                shadow_pos_y = CGFloat(shadow_pos_y_p)
                width_border = CGFloat(width_border1)
                rotate_btn = CGFloat(rotate_btn1)
                shadow2 = CGFloat(shadow2_2)
                round_btn12 = CGFloat(round_btn12_2)
                spacing_outputbox = CGFloat(spacing_outputbox_conv)
                spacing_grid_hor = CGFloat(spacing_grid_hor_conv)
                spacing_grid_ver = CGFloat(spacing_grid_ver_conv)
                font_size2_1 = CGFloat(font_size2_2)
                font_size3 = CGFloat(font_size3_2)
                xemo = CGFloat(offsetx)
                yemo = CGFloat(offsety)
                used2 = true
                if used == false {
                    convcolor()
                    UserDefaults.standard.set(defaultSymbols, forKey: "Symbols")
                    used = true
                }
                cph = UserDefaults.standard.stringArray(forKey: "cph") ?? []
                coph = UserDefaults.standard.stringArray(forKey: "coph") ?? []
                symbols = UserDefaults.standard.stringArray(forKey: "Symbols") ?? []
                if started == false {
                    convcolor()
                } else if started == true {
                    convcolorback()
                }
        }
                }
    private func twist() {
        Thread.sleep(forTimeInterval: 1.0)
        withAnimation {
            deviceWidth = UIScreen.main.bounds.width
            deviceHeight = UIScreen.main.bounds.height
        }
    }
    private func calcgestures() {
        if !enteredNumber.isEmpty {
            enteredNumber = String(enteredNumber.dropLast())
        }
        if enteredNumber.isEmpty {
            output = "0"
            outputText = "0"
        }
        if !enteredNumber.isEmpty {
            output = enteredNumber
            outputText = enteredNumber
        }
    }
    private func calcgesture2() {
        calculateResult()
        currentOperation = .none
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
    
    private func buttonPressed(_ symbol: String) {
        switch symbol {
        case "0"..."9", ".":
            enteredNumber += symbol
            outputText = enteredNumber
        case "+", "-", "×", "÷":
            if outputText != "" {
                calculateResult()
            }
            enteredNumber = ""
            if let number = Double(outputText) {
                previousNumber = number
            }
            currentOperation = getOperationForSymbol(symbol)
        case "=":
            calculateResult()
            currentOperation = .none
            if laststringoperation == "" {
                laststringoperation = "n"
            }
            cph.append(enteredNumber+laststringoperation)
            UserDefaults.standard.set(cph, forKey: "cph")
        case "AC":
            enteredNumber = ""
            currentOperation = .none
            previousNumber = 0.0
            output = "0"
            outputText = "0"
            enteredNumber = ""
            laststringoperation = ""
        case "ANS":
            enteredNumber = "\(previousResult)"
            outputText = enteredNumber
        case "sin":
            if let enteredNumberInDegrees = Double(enteredNumber) {
                let result = sin(enteredNumberInDegrees * Double.pi / 180.0)
                outputText = formatOutput(result) // Format the result
                enteredNumber = outputText
                laststringoperation = "s"
            } else {
                outputText = "Error: Invalid input"
            }
        case "cos":
            if let enteredNumberInDegrees = Double(enteredNumber) {
                let result = cos(enteredNumberInDegrees * Double.pi / 180.0)
                outputText = formatOutput(result) // Format the result
                enteredNumber = outputText
                laststringoperation = "c"
            } else {
                outputText = "Error: Invalid input"
            }
        case "tan":
            if let enteredNumberInDegrees = Double(enteredNumber) {    //sin⁻¹
                let result = tan(enteredNumberInDegrees * Double.pi / 180.0)
                outputText = formatOutput(result) // Format the result
                enteredNumber = outputText
                laststringoperation = "t"
            } else {
                outputText = "Error: Invalid input"
            }
        case "sin⁻¹":
            if let enteredNumberInDegrees = Double(enteredNumber) {
                let result = asin(enteredNumberInDegrees) * 180.0 / Double.pi
                outputText = formatOutput(result) // Format the result
                enteredNumber = outputText
                laststringoperation = "S"
            } else {
                outputText = "Error: Invalid input"
            }
        case "cos⁻¹":
            if let enteredNumberInDegrees = Double(enteredNumber) {
                let result = acos(enteredNumberInDegrees) * 180.0 / Double.pi
                outputText = formatOutput(result) // Format the result
                enteredNumber = outputText
                laststringoperation = "C"
            } else {
                outputText = "Error: Invalid input"
            }
        case "tan⁻¹":
            if let enteredNumberInDegrees = Double(enteredNumber) {    //sin⁻¹
                let result = atan(enteredNumberInDegrees) * 180.0 / Double.pi
                outputText = formatOutput(result) // Format the result
                enteredNumber = outputText
                laststringoperation = "T"
            } else {
                outputText = "Error: Invalid input"
            }
        case "π":
            enteredNumber = "\(Double.pi)"
            outputText = enteredNumber
        case "√":
                    if let enteredNumber = Double(enteredNumber) {
                        if enteredNumber >= 0 {
                            let result = sqrt(enteredNumber)
                            outputText = formatOutput(result) // Format the result
                            let enteredNumber = outputText
                            laststringoperation = "√"
                        } else {
                            outputText = "Error: Invalid input"
                        }
                    }
        case "Rand":
                let randomNumber = Double.random(in: 0..<1)
                enteredNumber = "\(randomNumber)"
                outputText = enteredNumber
        case "%":
                if let number = Double(enteredNumber) {
                    let percentage = number / 100.0
                    enteredNumber = "\(percentage)"
                    outputText = enteredNumber
                    laststringoperation = "%"
                }
        default:
            break
        }
        
    }
    private func getOperationForSymbol(_ symbol: String) -> CalculatorOperation {
            switch symbol {
            case "+":
                laststringoperation = "+"
                return .add
            case "-":
                laststringoperation = "-"
                return .subtract
            case "×":
                laststringoperation = "×"
                return .multiply
            case "÷":
                laststringoperation = "÷"
                return .divide
            case "√":
                laststringoperation = "√"
                return .squareRoot
            default:
                return .none
            }
        }
    private func performOperation(_ operation: CalculatorOperation) {
        if let number = Double(enteredNumber) {
            enteredNumber = ""
            currentOperation = operation
            previousNumber = number
        }
    }

    
    private func calculateResult() {
        if let number = Double(enteredNumber) {
            switch currentOperation {
            case .add:
                previousNumber += number
            case .subtract:
                previousNumber -= number
            case .multiply:
                previousNumber *= number
            case .divide:
                previousNumber /= number
            case .squareRoot:
                previousNumber = sqrt(number)
            case .none:
                previousNumber = number
            }
            
            let formattedResult = formatOutput(previousNumber)
            outputText = formattedResult
            enteredNumber = formattedResult
        }
    }
    private func formatOutput(_ number: Double) -> String {
        if number.isNaN || number.isInfinite {
            return "Error"
        }
        
        if floor(number) == number {
            if let intValue = Int(exactly: number) {
                return String(intValue)
            }
        }
        
        return String(format: "%.9g", number)
    }

    private func triggerHapticFeedback() {
            let generator = UIImpactFeedbackGenerator(style: hpt)
            generator.prepare()
            generator.impactOccurred()
        }
}

class MusicPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    private var player: AVAudioPlayer?
    
    @Published var isPlaying: Bool = false
    @Published var currentTime: String = "00:00"
    
    private func updateTime() {
        guard let player = player else { return }
        
        let minutes = Int(player.currentTime / 60)
        let seconds = Int(player.currentTime.truncatingRemainder(dividingBy: 60))
        
        currentTime = String(format: "%02d:%02d", minutes, seconds)
    }
    
    func loadMusic(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: nil) else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func play() {
        guard let player = player else { return }
        
        if player.isPlaying {
            // Pause the current sound
            player.pause()
            isPlaying = false
        } else {
            // Play the new sound while keeping the previous sound playing
            player.play()
            isPlaying = true
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.updateTime()
        }
    }
    
    func stop() {
        guard let player = player else { return }
        
        player.stop()
        player.currentTime = 0
        isPlaying = false
        currentTime = "00:00"
    }
    private func getIndex(_ symbol: String, in array: [String]) -> Int {
            guard let index = array.firstIndex(of: symbol) else {
                return -1
            }
            return index
        }
}

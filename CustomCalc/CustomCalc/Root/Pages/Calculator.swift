import SwiftUI
import AVFoundation

enum CalculatorOperation {
    case none, add, subtract, multiply, divide
}

struct Calculator: View {
    @State private var enteredNumber = ""
    @State private var currentOperation: CalculatorOperation = .none
    @State private var previousNumber = 0.0
    @State private var outputText = ""
    @State private var output = "0"
    @State private var previousResult: Double = 0.0
    @State private var lastEnteredNumber: Double = 0.0
    @State private var lastOperation: CalculatorOperation = .none
    @StateObject var player = MusicPlayer()
    @Binding var width_calc_button: CGFloat
    @Binding var height_calc_button: CGFloat
    @Binding var round_btn: CGFloat
    @Binding var selcolor: Color
    @Binding var selcolor2: Color
    @Binding var selcolor3: Color
    @Binding var font_size: CGFloat
    @Binding var font_size2: Int
    @Binding var width_calc_button2: Int
    @Binding var height_calc_button2: Int
    @Binding var shadow1: CGFloat
    @Binding var shadow1_2: Int
    @Binding var round_btn2: Int
    @Binding var shadow_opacity_1: CGFloat
    @Binding var shadow_opacity_1_2: Int
    @Binding var shadow_pos_x: CGFloat
    @Binding var shadow_pos_y: CGFloat
    @Binding var shadow_pos_x_p: Int
    @Binding var shadow_pos_y_p: Int
    @Binding var selcolor4: Color
    @Binding var grid_count: Int
    @Binding var symbols: [String]
    @Binding var width_border: CGFloat
    @Binding var send_var: Bool
    @Binding var color_border: Color
    @Binding var width_border1: Int
    @Binding var rotate_btn: CGFloat
    @Binding var rotate_btn1: Int
    @Binding var shadow2: CGFloat
    @Binding var hpt: UIImpactFeedbackGenerator.FeedbackStyle
    @Binding var sound: String
    @Binding var shadow2_2: Int
    @Binding var selcolor5: Color
    @Binding var setup: Bool
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
    @State private var testingshit: CGFloat = 1000
    @State private var started = true
    @Binding var spacing_grid_hor: CGFloat
    @Binding var spacing_grid_ver: CGFloat
    @Binding var spacing_outputbox_conv: Int
    @Binding var spacing_grid_hor_conv: Int
    @Binding var spacing_grid_ver_conv: Int
    @Binding var colorString7: String
    @Binding var uicolor: Color
    @Binding var fontName: String
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 3000)
                        .foregroundColor(selcolor3)
                    Rectangle()
                            .opacity(0)
                            .frame(height: spacing_outputbox_down)
                        Rectangle()
                            .frame(width: width_output_box, height: height_output_box)
                            .cornerRadius(round_btn)
                            .foregroundColor(selcolor)
                            .shadow(color: selcolor4.opacity(shadow_opacity_1), radius: shadow1, x: shadow_pos_x, y: shadow_pos_y)
                            .overlay {
                                VStack {
                                    Text(outputText)
                                        .font(.system(size: 35))
                                        .foregroundColor(selcolor2)
                                        .frame(width: width_output_box-15, height: height_output_box-10)
                                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                                        .shadow(color: selcolor5.opacity(shadow_opacity_1), radius: shadow2, x: 0, y: 0)
                                    Rectangle()
                                        .opacity(0)
                                        .frame(height: 40)
                                }
                            }
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
                                            .frame(width: width_calc_button+width_border, height: height_calc_button+width_border)
                                            .cornerRadius(round_btn)
                                            .shadow(color: selcolor4.opacity(shadow_opacity_1), radius: shadow1, x: shadow_pos_x, y: shadow_pos_y)
                                            .foregroundColor(color_border)
                                            .rotationEffect(Angle(degrees: rotate_btn))
                                        Text("")
                                            .frame(width: width_calc_button, height: height_calc_button)
                                            .background(selcolor)
                                            .foregroundColor(selcolor2)
                                            .cornerRadius(round_btn)
                                            .rotationEffect(Angle(degrees: rotate_btn))
                                        Text(symbol)
                                            .foregroundColor(selcolor2)
                                            .font(.custom(fontName, size: font_size))
                                            .rotationEffect(Angle(degrees: rotate_btn+round_btn12))
                                            .shadow(color: selcolor5.opacity(shadow_opacity_1), radius: shadow2, x: 0, y: 0)
                                    }
                                }
                            }
                        }
                        .frame(width: spacing_grid_ver)
                        }
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                        .padding(.horizontal)
                    Rectangle()
                        .frame(height: 3000)
                        .foregroundColor(selcolor3)
                }
                .background(selcolor3)
                .frame(width: 500, height: testingshit) //width: 375
                .cornerRadius(round_btn)
                .edgesIgnoringSafeArea(.all)
            }
        }
            .onAppear {
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
                symbols = UserDefaults.standard.stringArray(forKey: "Symbols") ?? []
                if started == false {
                    convcolor()
                } else if started == true {
                    convcolorback()
                }
        }
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
        selcolor5 = hexStringToColor(colorString6)
        color_border = hexStringToColor(colorString5)
        uicolor = hexStringToColor(colorString7)
    }
    private func loadSymbols() -> [String] {
        guard let url = Bundle.main.url(forResource: "Symbols", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let symbols = try? JSONDecoder().decode([String].self, from: data) else {
            return []
        }
        return symbols
    }
    
    static func saveSymbols(_ symbols: [String]) {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?
                .appendingPathComponent("Symbols.json") else { return }
        let data = try? JSONEncoder().encode(symbols)
        try? data?.write(to: url)
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
        case "AC":
            enteredNumber = ""
            currentOperation = .none
            previousNumber = 0.0
            output = "0"
            outputText = "0"
            enteredNumber = ""
        case "ANS":
            enteredNumber = "\(previousResult)"
            outputText = enteredNumber
        case "sin":
            if let enteredNumberInDegrees = Double(enteredNumber) {
                let result = sin(enteredNumberInDegrees * Double.pi / 180.0)
                outputText = formatOutput(result) // Format the result
            } else {
                outputText = "Error: Invalid input"
            }
        case "cos":
            if let enteredNumberInDegrees = Double(enteredNumber) {
                let result = cos(enteredNumberInDegrees * Double.pi / 180.0)
                outputText = formatOutput(result) // Format the result
            } else {
                outputText = "Error: Invalid input"
            }
        case "tan":
            if let enteredNumberInDegrees = Double(enteredNumber) {
                let result = tan(enteredNumberInDegrees * Double.pi / 180.0)
                outputText = formatOutput(result) // Format the result
            } else {
                outputText = "Error: Invalid input"
            }
        case "π":
            enteredNumber = "\(Double.pi)"
            outputText = enteredNumber
        default:
            break
        }
    }
    private func getOperationForSymbol(_ symbol: String) -> CalculatorOperation {
            switch symbol {
            case "+":
                return .add
            case "-":
                return .subtract
            case "×":
                return .multiply
            case "÷":
                return .divide
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
            return String(Int(number))
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
}

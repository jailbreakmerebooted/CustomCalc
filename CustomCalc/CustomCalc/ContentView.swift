import SwiftUI
import UIKit
import Foundation

struct Colorful: View {
    @State private var width_calc_button: CGFloat = 10.0
    @AppStorage("width_calc_button2") var width_calc_button2: Int = 10
    @State private var height_calc_button: CGFloat = 10.0
    @AppStorage("heigt_calc_button2") var height_calc_button2: Int = 10
    @State private var selcolor = Color.black
    @State private var selcolor2 = Color.black
    @State private var selcolor3 = Color.black
    @State private var shadow1: CGFloat = 10.0
    @State private var round_btn: CGFloat = 10.0
    @AppStorage("round_btn2") var round_btn2: Int = 10
    @State private var font_size: CGFloat = 10.0
    @AppStorage("font_size2") var font_size2: Int = 10
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Calculator(width_calc_button: $width_calc_button, height_calc_button: $height_calc_button, round_btn: $round_btn, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, font_size: $font_size)) {
                    Text("Calculator")
                }
                NavigationLink(destination: CalculatorSettings(width_calc_button: $width_calc_button, width_calc_button2: $width_calc_button2, height_calc_button: $height_calc_button, height_calc_button2: $height_calc_button2, selcolor: $selcolor, selcolor2: $selcolor2, selcolor3: $selcolor3, round_btn2: $round_btn2, round_btn: $round_btn, font_size2: $font_size2, font_size: $font_size, shadow1: $shadow1)) {
                    Text("Settings")
                }
            }
            .navigationTitle("CustomCalc")
            .onAppear {
                round_btn = CGFloat(round_btn2)
                font_size = CGFloat(font_size2)
                width_calc_button = CGFloat(width_calc_button2)
                height_calc_button = CGFloat(height_calc_button2)
            }
        }
        .onAppear {
            if let primaryColorData = UserDefaults.standard.data(forKey: "primaryColor"),
               let secondaryColorData = UserDefaults.standard.data(forKey: "secondaryColor"),
               let thirdColorData = UserDefaults.standard.data(forKey: "thirdColor"),
               let primaryColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: primaryColorData),
               let secondaryColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: secondaryColorData),
               let thirdColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: thirdColorData)
            {
                selcolor = Color(primaryColor)
                selcolor2 = Color(secondaryColor)
                selcolor3 = Color(thirdColor)
            }
        }
        .onChange(of: selcolor) { newColor in
            let primaryColorData = try? NSKeyedArchiver.archivedData(withRootObject: UIColor(newColor), requiringSecureCoding: false)
            UserDefaults.standard.set(primaryColorData, forKey: "primaryColor")
        }
        .onChange(of: selcolor2) { newColor in
            let secondaryColorData = try? NSKeyedArchiver.archivedData(withRootObject: UIColor(newColor), requiringSecureCoding: false)
            UserDefaults.standard.set(secondaryColorData, forKey: "secondaryColor")
        }
        .onChange(of: selcolor3) { newColor in
            let thirdColorData = try? NSKeyedArchiver.archivedData(withRootObject: UIColor(newColor), requiringSecureCoding: false)
            UserDefaults.standard.set(thirdColorData, forKey: "thirdColor")
        }
    }
      }
    
    struct CalculatorSettings: View {
        let colorPalette = [Color.black, Color.red, Color.blue, Color.green, Color.yellow, Color.white, Color.gray, Color.purple, Color.pink]
        @Binding var width_calc_button: CGFloat
        @Binding var width_calc_button2: Int
        @Binding var height_calc_button: CGFloat
        @Binding var height_calc_button2: Int
        @Binding var selcolor: Color
        @Binding var selcolor2: Color
        @Binding var selcolor3: Color
        @Binding var round_btn2: Int
        @Binding var round_btn: CGFloat
        @Binding var font_size2: Int
        @Binding var font_size: CGFloat
        @Binding var shadow1: CGFloat
        var body: some View {
                    List {
                    Section {
                    ZStack {
                        Rectangle()
                            .opacity(0)
                            .frame(height: 250)
                            .overlay {
                                ZStack {
                                    Rectangle()
                                        .frame(width: width_calc_button, height: height_calc_button)
                                        .foregroundColor(selcolor)
                                        .background(selcolor2)
                                        .cornerRadius(round_btn)
                                        .shadow(color: Color.black.opacity(0.3), radius: shadow1, x: 5, y: 5)
                                    Text("0")
                                        .foregroundColor(selcolor2)
                                        .font(.system(size: font_size))
                                }
                            }
                    }
                }
                .listRowBackground(selcolor3)
                Section(header: Text("Font Size")) {
                    Slider(value: $font_size, in: 0...100)
                }
                Section(header: Text("Width of Buttons")) {
                    Slider(value: $width_calc_button, in: 0...100)
                }
                Section(header: Text("Height of Buttons")) {
                    Slider(value: $height_calc_button, in: 0...100)
                }
                Section(header: Text("Button Roundness")) {
                    Slider(value: $round_btn, in: 0...25)
                }
                Section(header: Text("Colors and Shadows")) {
                    NavigationLink(destination: OtherCUS()) {
                        Text("Shadow")
                }
                    Picker("Background", selection: $selcolor3) {
                        ForEach(colorPalette, id: \.self) { color in
                            Text(color.description.capitalized)
                                .foregroundColor(color)
                                .tag(color)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                    Picker("Module Background", selection: $selcolor) {
                        ForEach(colorPalette, id: \.self) { color in
                            Text(color.description.capitalized)
                                .foregroundColor(color)
                                .tag(color)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                    Picker("Text", selection: $selcolor2) {
                        ForEach(colorPalette, id: \.self) { color in
                            Text(color.description.capitalized)
                                .foregroundColor(color)
                                .tag(color)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
                Button("Save") {
                    round_btn2 = Int(round_btn)
                    font_size2 = Int(font_size)
                    width_calc_button2 = Int(width_calc_button)
                    height_calc_button2 = Int(height_calc_button)
                }
            }
    
        }
    }

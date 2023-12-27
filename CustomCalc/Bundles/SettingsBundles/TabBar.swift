import SwiftUI

struct TabPick: View {
    @State private var selectedOptions = [0, 0, 0, 0]
    @Binding var tabbar1: String
    @Binding var tabbar2: String
    @Binding var tabbar3: String
    @Binding var tabbar4: String
    
    let options = [
        ["plus.slash.minus", "sum", "angle", "x.squareroot"],
        ["clock.arrow.circlepath", "clock", "clock.arrow.2.circlepath"],
        ["pencil.and.outline", "bold", "abc", "highlighter"],
        ["slider.horizontal.3", "gear", "gearshape", "gearshape.2"]
    ]
    
    var body: some View {
        List {
            ZStack {
                /*Rectangle()
                    .opacity(0)
                    .frame(height: 175)*/
                
                VStack {
                    HStack {
                        Picker(selection: $selectedOptions[0], label: Text("")) {
                            ForEach(0..<options[0].count) { index in
                                Image(systemName: options[0][index])
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .onChange(of: selectedOptions[0]) { newValue in
                            tabbar1 = options[0][newValue]
                        }
                        .onAppear {
                            if let selectedIndex = options[0].firstIndex(of: tabbar1) {
                                selectedOptions[0] = selectedIndex
                            }
                        }
                        Picker(selection: $selectedOptions[1], label: Text("")) {
                            ForEach(0..<options[1].count) { index in
                                Image(systemName: options[1][index])
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .onChange(of: selectedOptions[1]) { newValue in
                            tabbar2 = options[1][newValue]
                        }
                        .onAppear {
                            if let selectedIndex = options[1].firstIndex(of: tabbar2) {
                                selectedOptions[1] = selectedIndex
                            }
                        }
                        
                        Picker(selection: $selectedOptions[2], label: Text("")) {
                            ForEach(0..<options[2].count) { index in
                                Image(systemName: options[2][index])
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .onChange(of: selectedOptions[2]) { newValue in
                            tabbar3 = options[2][newValue]
                        }
                        .onAppear {
                            if let selectedIndex = options[2].firstIndex(of: tabbar3) {
                                selectedOptions[2] = selectedIndex
                            }
                        }
                        
                        Picker(selection: $selectedOptions[3], label: Text("")) {
                            ForEach(0..<options[3].count) { index in
                                Image(systemName: options[3][index])
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .onChange(of: selectedOptions[3]) { newValue in
                            tabbar4 = options[3][newValue]
                        }
                        .onAppear {
                            if let selectedIndex = options[3].firstIndex(of: tabbar4) {
                                selectedOptions[3] = selectedIndex
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("TabBar")
        }
    }
}

import SwiftUI

struct GridSettings: View {
    @Binding var grid_count: Int
    @Binding var symbols: [String]
    @Binding var spacing_grid_hor: CGFloat
    @Binding var spacing_grid_ver: CGFloat
    @Binding var spacing_outputbox: CGFloat
    @State private var spacing_geo: CGFloat = 0
    @State private var grid_hor_geo: CGFloat = 0
    @State private var grid_ver_geo: CGFloat = 0
    var body: some View {
        List {
            if UIDevice.current.userInterfaceIdiom == .pad {
                Stepper("\(grid_count)", value: $grid_count, in: 1...20, step: 1)
            } else {
                Stepper("\(grid_count)", value: $grid_count, in: 1...10, step: 1) //10
            }
            NavigationLink(destination: SymbolGridView(grid_count: $grid_count, symbols: symbols)) {
                Text("Grid Items")
            }
            Section(header: Text("Grid Size")) {
                    HStack {
                        Text("Height")
                            .frame(width: 150)
                        Slider(value: $spacing_grid_hor, in: 0...grid_hor_geo) //50
                    }
                    HStack {
                        Text("Width")
                            .frame(width: 150)
                        Slider(value: $spacing_grid_ver, in: 0...grid_ver_geo) //500
                    }
                    HStack {
                        Text("Spacing")
                            .frame(width: 150)
                        Slider(value: $spacing_outputbox, in: 0...spacing_geo) //75
                    }
                Button("Reset Size") {
                    spacing_grid_hor = 10
                    spacing_grid_ver = 375
                    spacing_outputbox = 30
                }
            }
        }
        .navigationTitle("Grid")
        .onAppear {
            if UIDevice.current.userInterfaceIdiom == .pad {
                spacing_geo = 150
                grid_hor_geo = 200
                grid_ver_geo = 2000
            } else {
                spacing_geo = 75
                grid_hor_geo = 50
                grid_ver_geo = 500
            }
        }
    }
}

struct SymbolGridView: View {
    @Binding var grid_count: Int
    @State private var enb = false
    @State var symbols: [String] = UserDefaults.standard.stringArray(forKey: "Symbols") ?? []
    let defaultSymbols = ["AC", "sin", "cos", "tan", "7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", ".", "=", "+"]
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: grid_count)
        VStack {
            Spacer()
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(symbols, id: \.self) { symbol in
                    Text(symbol)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                }
            }
            .padding()
            .navigationBarTitle("Grid Items")
            .navigationBarItems(trailing: Button("Edit") {
                enb = true
            })
            .sheet(isPresented: $enb) {
                SymbolEditorView(symbols: $symbols, defaultSymbols: defaultSymbols)
            }
            .onAppear {
                symbols = UserDefaults.standard.stringArray(forKey: "Symbols") ?? []
            }
            .onDisappear {
                UserDefaults.standard.set(symbols, forKey: "Symbols")
            }
            Spacer()
        }
    }
}

struct SymbolEditorView: View {
    @Binding var symbols: [String]
    @State private var editMode: EditMode = .inactive
    let defaultSymbols: [String]
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            List {
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {
                                symbols = defaultSymbols
                                UserDefaults.standard.set(symbols, forKey: "Symbols")
                            }){
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .cornerRadius(10)
                                    Text("Restore Defaults")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 12))
                                }
                            }
                            Button(action: {
                                addUniqueSymbols([""])
                            }){
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .cornerRadius(10)
                                    Text("Add Symbol")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 12))
                                }
                            }
                            Button(action: {
                                symbols = []
                            }){
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .cornerRadius(10)
                                    Text("Delete all symbols")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 12))
                                }
                            }
                        }
                    }
                    .frame(height: 75)
                }
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {
                                symbols = defaultSymbols
                                UserDefaults.standard.set(symbols, forKey: "Symbols")
                            }){
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .cornerRadius(10)
                                    Text("Add")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 12))
                                }
                            }
                            Button(action: {
                                addUniqueSymbols([""])
                            }){
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .cornerRadius(10)
                                    Text("Add Symbol")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 12))
                                }
                            }
                            Button(action: {
                                symbols = []
                            }){
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .cornerRadius(10)
                                    Text("Delete all symbols")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 12))
                                }
                            }
                        }
                    }
                    .frame(height: 75)
                }
                Section {
                    ForEach(symbols.indices, id: \.self) { index in
                        TextField("Symbol", text: $symbols[index])
                            .disableAutocorrection(true)
                    }
                    .onDelete { indexSet in
                        symbols.remove(atOffsets: indexSet)
                        UserDefaults.standard.set(symbols, forKey: "Symbols")
                    }
                    .onMove { source, destination in
                        symbols.move(fromOffsets: source, toOffset: destination)
                        UserDefaults.standard.set(symbols, forKey: "Symbols")
                    }
                }
                if editMode == .inactive {
                    Section {
                        Button("Add Normal Operations", action: {
                            addUniqueSymbols(["=", "-", "+", "×", "÷", "AC"])
                        })
                        .frame(height: 125)
                        Button("Add trigonometry functions", action: {
                            addUniqueSymbols(["sin", "cos", "tan", "sin⁻¹", "cos⁻¹", "tan⁻¹"])
                        })
                        .frame(height: 125)
                        Button("Add π", action: {
                            addUniqueSymbols(["π"])
                        })
                        .frame(height: 125)
                        Button("Add √", action: {
                            addUniqueSymbols(["√"])
                        })
                        .frame(height: 125)
                        Button("Add %", action: {
                            addUniqueSymbols(["%"])
                        })
                        .frame(height: 125)
                        Button("Add Rand", action: {
                            addUniqueSymbols(["Rand"])
                        })
                        .frame(height: 125)
                    }
                }
            }
            .navigationBarTitle("Edit Symbols")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            }, trailing: EditButton())
            .environment(\.editMode, $editMode)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Duplicate Symbol"),
                    message: Text("Some of the Symbols are allready inside the grid, only unique symbols will be added!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationViewStyle(.stack)
    }

    private func dismiss() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    }

    private func addUniqueSymbols(_ symbolsToAdd: [String]) {
        for symbol in symbolsToAdd {
            if !symbols.contains(symbol) {
                symbols.append(symbol)
                UserDefaults.standard.set(symbols, forKey: "Symbols")
            } else {
                showAlert = true
            }
        }
    }
}

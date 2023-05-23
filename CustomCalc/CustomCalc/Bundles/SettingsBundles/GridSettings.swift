import SwiftUI
import MobileCoreServices

struct GridSettings: View {
    @Binding var grid_count: Int
    @Binding var symbols: [String]
    @Binding var spacing_grid_hor: CGFloat
    @Binding var spacing_grid_ver: CGFloat
    @Binding var spacing_outputbox: CGFloat
    var body: some View {
        List {
            Stepper("\(grid_count)", value: $grid_count, in: 1...10, step: 1)
            NavigationLink(destination: SymbolGridView(grid_count: $grid_count, symbols: symbols)) {
                Text("Grid Items")
            }
            Section(header: Text("Grid Size")) {
                HStack {
                    Text("Height")
                        .frame(width: 150)
                    Slider(value: $spacing_grid_hor, in: 0...50)
                }
                HStack {
                    Text("Width")
                        .frame(width: 150)
                    Slider(value: $spacing_grid_ver, in: 0...500)
                }
                HStack {
                    Text("Spacing")
                        .frame(width: 150)
                    Slider(value: $spacing_outputbox, in: 0...75)
                }
                Button("Reset Size") {
                    spacing_grid_hor = 10
                    spacing_grid_ver = 375
                    spacing_outputbox = 30
                }
            }
        }
        .navigationTitle("Grid")
    }
}

struct SymbolGridView: View {
    @Binding var grid_count: Int
    @State private var enb = false
    @State var symbols: [String] = UserDefaults.standard.stringArray(forKey: "Symbols") ?? []
    let defaultSymbols = ["AC", "sin", "cos", "tan", "7", "8", "9", "÷", "4", "5", "6", "×", "1", "2", "3", "-", "0", ".", "=", "+"]
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: grid_count)
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
    }
}

struct SymbolEditorView: View {
    @Binding var symbols: [String]
    @State private var editMode: EditMode = .inactive
    let defaultSymbols: [String]

    var body: some View {
        NavigationView {
                List {
                    Section {
                        ForEach(symbols.indices, id: \.self) { index in
                            TextField("Symbol", text: $symbols[index])
                                .disableAutocorrection(true)
                        }
                        .onDelete { indexSet in
                            symbols.remove(atOffsets: indexSet)
                        }
                        .onMove { source, destination in
                            symbols.move(fromOffsets: source, toOffset: destination)
                        }
                    }
                    if editMode == .inactive {
                        Section {
                        Button("Restore Defaults", action: {
                            symbols = defaultSymbols
                        })
                        .foregroundColor(.orange)
                        Button("Add Symbol", action: {
                            symbols.append("")
                        })
                        .foregroundColor(.green)
                        Button("Delete all Symbols", action: {
                            symbols = []
                        })
                        .foregroundColor(.red)
                    }
                        Section {
                            Button("Add Numbers", action: {
                                symbols.append("1")
                                symbols.append("2")
                                symbols.append("3")
                                symbols.append("4")
                                symbols.append("5")
                                symbols.append("6")
                                symbols.append("7")
                                symbols.append("8")
                                symbols.append("9")
                                symbols.append("0")
                                symbols.append(".")
                            })
                            .frame(height: 125)
                            Button("Add Normal Operations", action: {
                                symbols.append("=")
                                symbols.append("-")
                                symbols.append("+")
                                symbols.append("×")
                                symbols.append("÷")
                                symbols.append("AC")
                            })
                            .frame(height: 125)
                            Button("Add Sinus Sentence", action: {
                                symbols.append("sin")
                                symbols.append("cos")
                                symbols.append("tan")
                            })
                            .frame(height: 125)
                            Button("Add π", action: {
                                symbols.append("π")
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
        }
    }

    private func dismiss() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    }
}

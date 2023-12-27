import SwiftUI

struct historybundle: View {
    @Binding var cph: [String]
    @Binding var coph: [String]
    @Binding var uicolor: Color
    @Binding var selcolor3: Color
    @Binding var selcolor2: Color
    @Binding var selcolor: Color
    var body: some View {
        NavigationView {
            List {
                Section() {
                    ForEach(cph, id: \.self) { item in
                        HistoryItemView(item: item, uicolor: $uicolor)
                        .listRowBackground(selcolor)
                    }
                    .onDelete(perform: deleteItem)
                    if cph == [] {
                        ZStack {
                            Rectangle()
                                .frame(height: 100)
                                .opacity(0)
                            VStack {
                                Rectangle()
                                    .opacity(0)
                                    .frame(height: 20)
                                Image(systemName: "clock.arrow.circlepath")
                                    .scaleEffect(1.5)
                                Spacer()
                                Text("Just calculate something")
                                    .font(.system(size: 13))
                                Rectangle()
                                    .opacity(0)
                                    .frame(height: 20)
                            }
                        }
                    }
                }
            }
            .background(selcolor3)
            .scrollContentBackground(.hidden)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("History")
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        cph.remove(atOffsets: offsets)
        saveItems()
    }
    
    func saveItems() {
        UserDefaults.standard.set(cph, forKey: "cph")
    }
}

struct HistoryItemView: View {
    var item: String
    @State private var updatedItem = ""
    @State private var isCopied = false
    @State private var lastCharacter: String = ""
    @Binding var uicolor: Color
    var body: some View {
        HStack {
            Text(updatedItem)
                .onAppear {
                    updatedItem = item
                    updatedItem.removeLast()
                }
            Spacer()
            Button(action: {
                copyToClipboard()
            }) {
                HStack {
                    Rectangle()
                        .foregroundColor(uicolor)
                        .frame(width: 50, height: 30)
                        .cornerRadius(13)
                        .overlay {
                            Text(lastCharacter)
                                .foregroundColor(Color.white)
                        }
                        .onAppear {
                            lastCharacter = String(item.last ?? Character(""))
                            if lastCharacter == "s" {
                                lastCharacter = "sin"
                            } else if lastCharacter == "c" {
                                lastCharacter = "cos"
                            } else if lastCharacter == "t" {
                                lastCharacter = "tan"
                            } else if lastCharacter == "S" {
                                lastCharacter = "sin⁻¹"
                            } else if lastCharacter == "C" {
                                lastCharacter = "cos⁻¹"
                            } else if lastCharacter == "T" {
                                lastCharacter = "tan⁻¹"
                            }
                        }
                    Rectangle()
                        .opacity(0)
                        .frame(width: 2)
                    Image(systemName: isCopied ? "checkmark" : "doc.on.doc")
                        .foregroundColor(isCopied ? uicolor : .primary)
                        .rotationEffect(.degrees(isCopied ? 360 : 0))
                        .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
                        .scaleEffect(isCopied ? 1.2 : 1.0)
                        .animation(.spring(response: 0.4, dampingFraction: 0.6))
                        .frame(width: 20)
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            copyToClipboard()
            triggerHapticFeedback()
        }
    }

    private func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }

    private func copyToClipboard() {
        let updatedItem = item.dropLast()
        UIPasteboard.general.string = String(updatedItem)
        isCopied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isCopied = false
        }
    }
}

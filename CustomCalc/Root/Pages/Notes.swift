import SwiftUI

struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}

struct Notes: View {
    @State var notes: [Note] = []
    @Binding var fontName2: String
    @Binding var selcolor3: Color
    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note, notes: self.$notes, fontName2: $fontName2, selcolor3: $selcolor3)) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                        }
                    }
                    .contentShape(Rectangle()) // Make the whole item tappable
                }
                .onDelete(perform: deleteNotes)
                
            }
            .background(selcolor3)
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing:
                Button(action: {
                    self.notes.append(Note(title: "New Note", content: ""))
                    saveNotesData(notes: self.notes) // Save the notes data
                }) {
                    Image(systemName: "plus")
                }
            )
            .onAppear {
                self.notes = loadNotesData() // Load the notes data
            }
        }
    }
    
    // MARK: - Data Persistence
    
    func saveNotesData(notes: [Note]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(notes) {
            UserDefaults.standard.set(encoded, forKey: "notes")
        }
    }
    
    func loadNotesData() -> [Note] {
        if let data = UserDefaults.standard.data(forKey: "notes") {
            let decoder = JSONDecoder()
            if let notes = try? decoder.decode([Note].self, from: data) {
                return notes
            }
        }
        return []
    }
    
    func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        saveNotesData(notes: notes)
    }
}

struct NoteDetailView: View {
    @State var note: Note
    @Binding var notes: [Note]
    @Binding var fontName2: String
    @Binding var selcolor3: Color
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                TextField("Title", text: $note.title)
                    .font(.custom(fontName2, size: 35))
                TextEditor(text: $note.content)
                    .font(.custom(fontName2, size: 20))
                    .padding(.top, 8)
                    .scrollContentBackground(.hidden)
            }
            .onTapGesture {
                isEditing = true
            }
            .padding()
            .navigationBarItems(trailing:
                                    Button(action: {
                self.isEditing.toggle()
                if !self.isEditing {
                    if let index = self.notes.firstIndex(where: { $0.id == self.note.id }) {
                        self.notes[index] = self.note
                        saveNotesData(notes: self.notes) // Save the notes data
                    }
                }
            }) {
                if isEditing {
                    Text("Hide")
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            isEditing = false
                        }
                } else {
                    Text("")
                }
            }
            )
            .onDisappear {
                if !self.isEditing {
                    if let index = self.notes.firstIndex(where: { $0.id == self.note.id }) {
                        self.notes[index] = self.note
                        saveNotesData(notes: self.notes) // Save the notes data
                    }
                }
            }
        }
        .background(selcolor3)
    }

        
        func saveNotesData(notes: [Note]) {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(notes) {
                UserDefaults.standard.set(encoded, forKey: "notes")
            }
        }
        
        func loadNotesData() -> [Note] {
            if let data = UserDefaults.standard.data(forKey: "notes") {
                let decoder = JSONDecoder()
                if let notes = try? decoder.decode([Note].self, from: data) {
                    return notes
                }
            }
            return []
        }
    }

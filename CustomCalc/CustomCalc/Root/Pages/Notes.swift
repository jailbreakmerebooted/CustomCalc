import SwiftUI

struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}

struct Notes: View {
    @State var notes: [Note] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note, notes: self.$notes)) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteNotes)
            }
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
    @State private var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if isEditing {
                TextField("Title", text: $note.title)
                    .font(.largeTitle)
                TextEditor(text: $note.content)
                    .padding(.top, 8)
            } else {
                Text(note.title)
                    .font(.largeTitle)
                Text(note.content)
                    .padding(.top, 8)
                    .disabled(true)
                    .multilineTextAlignment(.leading)
            }
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
                    Text("Done")
                } else {
                    Text("Edit")
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

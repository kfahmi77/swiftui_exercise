//
//  ContentView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 30/06/24.
//

import SwiftUI

// Model for Note
struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: NSAttributedString
    var date: Date
}

// Sample data for preview
let sampleNotes = [
    Note(title: "Meeting Notes", content: NSAttributedString(string: "Discuss project roadmap and deadlines."), date: Date()),
    Note(title: "Grocery List", content: NSAttributedString(string: "Milk, Eggs, Bread, Butter"), date: Date().addingTimeInterval(-86400)),
    Note(title: "Travel Plans", content: NSAttributedString(string: "Book flights and hotel for vacation."), date: Date().addingTimeInterval(-172800))
]

// Main view
struct ContentView: View {
    @State private var notes = sampleNotes
    @State private var showAddNote = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("NoteKeeper")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                    Button(action: {
                        showAddNote = true
                    }) {
                        Text("NEW NOTE")
                            .font(.headline)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                List {
                    ForEach(notes) { note in
                        NavigationLink(destination: NoteDetailView(note: note, notes: $notes)) {
                            NoteRow(note: note)
                        }
                    }
                    .onDelete(perform: deleteNote)
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddNote) {
                AddNoteView(notes: $notes)
            }
        }
    }
    
    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

// View for each note row
struct NoteRow: View {
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
                .padding(.bottom, 2)
            Text(note.content.string)
                .lineLimit(1)
                .foregroundColor(.gray)
                .padding(.bottom, 2)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}


struct NoteDetailView: View {
    var note: Note
    @Binding var notes: [Note]
    @State private var showEditNote = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            RichTextEditor(text: .constant(note.content))
                .frame(height: 200)
                .padding(.bottom, 20)
            HStack {
                Button(action: {
                    showEditNote = true
                }) {
                    Text("EDIT")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                Spacer()
                Button(action: {
                    if let index = notes.firstIndex(where: { $0.id == note.id }) {
                        notes.remove(at: index)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("DELETE")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("View Note", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                Text("BACK")
            }
            .foregroundColor(.black)
        })
        .background(Color.yellow)
        .sheet(isPresented: $showEditNote) {
            EditNoteView(note: note, notes: $notes)
        }
    }
}

// View to add a new note
struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var notes: [Note]
    @State private var title = ""
    @State private var content = NSAttributedString(string: "")
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                .padding()
                Spacer()
                Text("Create Note")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .background(Color.yellow)
            
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                        .background(Color.gray.opacity(0.1))
                }
                Section(header: Text("Content")) {
                    RichTextEditor(text: $content)
                        .background(Color.gray.opacity(0.1))
                        .frame(height: 200)
                }
            }
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("DISCARD")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                Spacer()
                Button(action: {
                    let newNote = Note(title: title, content: content, date: Date())
                    notes.append(newNote)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("SAVE")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.yellow)
        }
    }
}

// View to edit an existing note
struct EditNoteView: View {
    var note: Note
    @Binding var notes: [Note]
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String
    @State private var content: NSAttributedString
    
    init(note: Note, notes: Binding<[Note]>) {
        self.note = note
        self._notes = notes
        self._title = State(initialValue: note.title)
        self._content = State(initialValue: note.content)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                .padding()
                Spacer()
                Text("Edit Note")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .background(Color.yellow)
            
            Form {
                           Section(header: Text("Title")) {
                               TextField("Enter title", text: $title)
                                   .background(Color.gray.opacity(0.1))
                           }
                           Section(header: Text("Content")) {
                               RichTextEditor(text: $content)
                                   .background(Color.gray.opacity(0.1))
                                   .frame(height: 200)
                           }
                       }
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("DISCARD")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                Spacer()
                Button(action: {
                    if let index = notes.firstIndex(where: { $0.id == note.id }) {
                        notes[index].title = title
                        notes[index].content = content
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("SAVE")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.yellow)
        }
    }
}

#Preview {
    ContentView()
}

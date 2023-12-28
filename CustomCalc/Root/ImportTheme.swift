//
//  ImportTheme.swift
//  CustCalc
//
//  Created by Matty on 28/12/2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct DocumentPicker: UIViewControllerRepresentable {
    var onPick: (URL) -> Void

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.json], asCopy: true) // Change UTType as needed
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker

        init(_ documentPicker: DocumentPicker) {
            self.parent = documentPicker
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            parent.onPick(url)
        }
    }
}
 
/* struct trythat: View {
     @State private var showDocumentPicker = false

     var body: some View {
         Button("Import Theme") {
             showDocumentPicker = true
         }
         .sheet(isPresented: $showDocumentPicker) {
             DocumentPicker { url in
                 // Handle the picked file
                 importTheme(from: url)
             }
         }
     }

     func importTheme(from url: URL) {
         // Implement your theme importing logic here
     }
 }
*/

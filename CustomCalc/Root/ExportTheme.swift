//
//  ExportTheme.swift
//  CustCalc
//
//  Created by Matty on 28/12/2023.
//

import Foundation

struct ExportDocumentPicker: UIViewControllerRepresentable {
    var fileURL: URL

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forExporting: [fileURL])
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}


/* same example
 
 struct ContentView: View {
     @State private var showExportPicker = false
     var themeFileURL: URL? // URL of the theme file to export

     var body: some View {
         Button("Export Theme") {
             if let url = themeFileURL {
                 showExportPicker = true
             }
         }
         .sheet(isPresented: $showExportPicker) {
             if let url = themeFileURL {
                 ExportDocumentPicker(fileURL: url)
             }
         }
     }
 }

 */

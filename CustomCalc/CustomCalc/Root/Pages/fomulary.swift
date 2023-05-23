import SwiftUI

struct fomulary: View {
    @Binding var fomulary_acti: Bool
    @Binding var fomulary_store: String
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: shapes_fom(fomulary_acti: $fomulary_acti, fomulary_store: $fomulary_store)) {
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .opacity(0)
                            HStack {
                                Text("Shapes")
                                    .font(.system(size: 40, weight: .bold))
                                Image(systemName: "triangle.fill")
                                    .frame(width: 75, height: 75)
                                    .scaleEffect(2.5)
                            }
                        }
                    }
                }
                .listRowBackground(Color.blue)
                .overlay(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0)]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                            .scaleEffect(1.2)
                                        )
                        Section {
                            ZStack {
                                Rectangle()
                                    .frame(height: 150)
                                    .opacity(0)
                                HStack {
                                    Text("Bodies")
                                        .font(.system(size: 40, weight: .bold))
                                    Image(systemName: "square.fill")
                                        .frame(width: 75, height: 75)
                                        .scaleEffect(2.5)
                                }
                            }
                        }
                        .listRowBackground(Color.red)
                        .overlay(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0)]),
                                                        startPoint: .top,
                                                        endPoint: .bottom
                                                    )
                                                    .scaleEffect(1.2)
                                                )
                Section {
                    NavigationLink(destination: updates()) {
                        Text("Changelog")
                    }
                }
            }
            .navigationTitle("Formulary")
        }
    }
}

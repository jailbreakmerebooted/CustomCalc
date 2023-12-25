import SwiftUI

struct Credits: View {
    var body: some View {
                List {
                    VStack {
                        Rectangle()
                            .frame(height: 10)
                            .opacity(0)
                        HStack {
                            Image("sean")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(100)
                            Spacer()
                            VStack {
                                Text("Sean Boleslawski")
                                Text("Main Developer")
                                    .font(.system(size: 10))
                            }
                            .frame(width: 200)
                            Rectangle()
                                .frame(width: 20)
                                .opacity(0)
                        }
                        Rectangle()
                            .frame(height: 10)
                            .opacity(0)
                    }
                    VStack {
                        Rectangle()
                            .frame(height: 10)
                            .opacity(0)
                        HStack {
                            Image("dilan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(100)
                            Spacer()
                            VStack {
                                Text("Dilan Önal")
                                Text("Some Inovating Ideas")
                                    .font(.system(size: 10))
                            }
                            .frame(width: 200)
                            Rectangle()
                                .frame(width: 20)
                                .opacity(0)
                        }
                        Rectangle()
                            .frame(height: 10)
                            .opacity(0)
                    }
                }
            .navigationTitle("Credits")
        }
}

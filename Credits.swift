//
//  Credits.swift
//  CustCalc
//
//  Created by Matty Cooper on 30/05/2023.
//

import SwiftUI
struct Credits: View {
    let SeanURL = URL(string: "https://twitter.com/BoleslawskiSean")!
    let MattycbtwURL = URL(string: "https://twitter.com/mattycbtw")!
    let GadgetmanURL = URL(string: "https://twitter.com/gadgetman78")!
    let dilanURL = URL(string: "https://twitter.com/crustrat13976")!
    let bіонарEкURL = URL(string: "https://t.me/aidenpearce5111")!
    @Binding var seluicolor: Color
    var body: some View {
                List {
                    Section(header: Text("Main")) {
                            VStack {
                                Link("Sean Boleslawski", destination: SeanURL)
                                Text("Main Developer")
                                    .font(.system(size: 10))
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        VStack {
                            Link("mattycbtw", destination: MattycbtwURL)
                            Text("Co Developer")
                                .font(.system(size: 10))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        VStack {
                            Link("Dilan Önal", destination: dilanURL)
                            Text("Some Inovating Ideas")
                                .font(.system(size: 10))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        VStack {
                            Link("Gedgetman", destination: GadgetmanURL)
                            Text("Some Inovating Ideas")
                                .font(.system(size: 10))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Section(header: Text("Translators")) {
                        VStack {
                            Link("Sean Boleslawski", destination: SeanURL)
                            Text("German")
                                .font(.system(size: 10))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        VStack {
                            Link("ВіонарEк", destination: bіонарEкURL)
                            Text("Arabic")
                                .font(.system(size: 10))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        VStack {
                            Text("AdelStar")
                            Text("French")
                                .font(.system(size: 10))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        VStack {
                            Text("Korpi")
                            Text("Finnish")
                                .font(.system(size: 10))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                }
                .background(seluicolor)
                .scrollContentBackground(.hidden)
                .navigationTitle("Credits")
        }
}

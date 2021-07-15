//
//  ContentView.swift
//  Demo
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FilmsView()
                .tabItem {
                    Label("Films", systemImage: "list.dash")
                }
            EyeColorsView()
                .tabItem {
                    Label("Eye Colors", systemImage: "eye")
                }
            PopulationsView()
                .tabItem {
                    Label("Populations", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

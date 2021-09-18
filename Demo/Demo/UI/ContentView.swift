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
                .environmentObject(FilmsViewModel())
                .tabItem {
                    Label("Films", systemImage: "list.dash")
                }
            EyeColorsView()
                .environmentObject(EyeColorsViewModel())
                .tabItem {
                    Label("Eye Colors", systemImage: "eye")
                }
            PopulationsView()
                .environmentObject(PopulationsViewModel())
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

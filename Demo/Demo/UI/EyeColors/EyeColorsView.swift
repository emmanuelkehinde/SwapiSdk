//
//  EyeColorsView.swift
//  Demo
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import SwiftUI
import Swapi

struct EyeColorsView: View {
    @EnvironmentObject var viewModel: EyeColorsViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.eyeColors.isEmpty {
                    ProgressView().padding(.top)
                } else {
                    LazyVGrid(columns: .init(repeating: .init(), count: 2), spacing: 16) {
                        ForEach(0..<viewModel.eyeColors.count) { index in
                            eyeColorRow(personEyeColor: viewModel.eyeColors[index])
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal)

                    Spacer()
                }
            }
            .navigationBarTitle("Eye Colors")
        }
        .onAppear(perform: {
            viewModel.fetchEyeColors()
        })
    }

    @ViewBuilder
    private func eyeColorRow(personEyeColor: PersonEyeColor) -> some View {
        ZStack {
            VStack(spacing: 16) {
                HStack {
                    Spacer()

                    Text(personEyeColor.eyeColor.capitalizingFirstLetter())
                        .lineLimit(1)
                        .font(.title2)
                        .foregroundColor(Color.black)

                    Spacer()
                }


                Text(personEyeColor.personName)
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundColor(Color.black.opacity(0.6))
                    .padding(.bottom, 8)
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.8), radius: 0.8)
            )
        }
    }
}

struct EyeColorsView_Previews: PreviewProvider {
    static var previews: some View {
        EyeColorsView()
    }
}

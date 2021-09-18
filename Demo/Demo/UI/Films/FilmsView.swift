//
//  FilmsView.swift
//  Demo
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import SwiftUI
import Swapi

struct FilmsView: View {
    @EnvironmentObject var viewModel: FilmsViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.films.isEmpty {
                    ProgressView().padding(.top)
                } else {
                    VStack {
                        ForEach(0..<viewModel.films.count) { index in
                            filmRow(film: viewModel.films[index])
                        }
                    }

                    Spacer()
                }
            }
            .navigationBarTitle("All Films")
        }
        .onAppear(perform: {
            viewModel.fetchFilms()
        })
    }

    @ViewBuilder
    private func filmRow(film: Film) -> some View {
        ZStack {
            VStack {
                VStack(spacing: 0) {
                    Image("starwars")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150, alignment: .center)

                    Divider()
                }

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(film.title)
                            .font(.headline)
                            .foregroundColor(Color.black)

                        Spacer()
                    }

                    Text(film.openingCrawl)
                        .lineLimit(2)
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                        .padding(.bottom, 8)

                    Text(film.releaseDate.toString())
                        .lineLimit(1)
                        .font(.caption)
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.3))
                        )
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.8), radius: 0.8)
            )
            .padding()
        }
    }
}

struct FilmsView_Previews: PreviewProvider {
    static var previews: some View {
        FilmsView()
    }
}

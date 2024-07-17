//
//  ContentView.swift
//  AstronomyPicture
//
//  Created by Ummer on 17/07/24.
//

import SwiftUI

struct ContentView : View {
    @ObservedObject var viewModel = AstronomyPictureViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.loading {
                    ProgressView()
                        .controlSize(.large)
                        .scaleEffect(2)
                } else {
                    List(viewModel.astroPictures, id: \.id) { picture in
                        NavigationLink(destination: AstroPictureDetailsView(astroPicture: picture)){
                            AstroPictureListView(astroPicture: picture)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Astronomy Pictures"))
        }
    }
}

#Preview {
    ContentView()
}

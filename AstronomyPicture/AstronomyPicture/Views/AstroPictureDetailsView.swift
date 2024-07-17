//
//  AstroPictureDetailsView.swift
//  AstronomyPicture
//
//  Created by Ummer on 17/07/24.
//

import SwiftUI

struct AstroPictureDetailsView : View {
    var astroPicture: AstroPicture
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: astroPicture.url)) { phase in
                    switch phase {
                    case .failure:
                        Image(systemName: "photo")
                            .font(.largeTitle)
                    case .success(let image):
                        image
                            .resizable()
                    default:
                        ProgressView()
                    }
                }
                .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
                HStack {
                    Text("Captured on:  \(Text(astroPicture.date).foregroundColor(.teal))")
                        .foregroundColor(.red).font(.system(size: 16).bold())
                    Spacer()
                }
                .padding(.bottom,4)
                HStack {
                    Text("Explanation").foregroundColor(.purple).font(.system(size: 16).bold()).underline()
                    Spacer()
                }
                .padding(.bottom,4)
                Text(astroPicture.explanation).lineLimit(nil)
                Spacer()
            }.navigationBarTitle(Text(astroPicture.title), displayMode: .inline)
                .padding()
        }
    }
}

#Preview {
    AstroPictureDetailsView(astroPicture: AstroPicture(date: "2024-01-09", title: "Title", explanation: "Explanation", media_type: "image", service_version: "v1", url: "https://apod.nasa.gov/apod/image/2401/ThorsHelmet_Biswas_960.jpg"))
}

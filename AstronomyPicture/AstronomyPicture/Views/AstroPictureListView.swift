//
//  AstroPictureListView.swift
//  AstronomyPicture
//
//  Created by Ummer on 17/07/24.
//

import SwiftUI

struct AstroPictureListView : View {
    var astroPicture: AstroPicture
    
    var body: some View {
        HStack {
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
            .frame(width: 90, height: 120)
            
            VStack {
                Spacer()
                HStack {
                    Text(astroPicture.title)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                    
                    Spacer()
                }
                HStack {
                    Text("Captured on  \(astroPicture.date)").foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
            }
        }.frame(height: 130)
    }
}

#Preview {
    AstroPictureListView(astroPicture: AstroPicture(date: "2024-01-09", title: "Title", explanation: "Explanation", media_type: "image", service_version: "v1", url: "https://apod.nasa.gov/apod/image/2401/ThorsHelmet_Biswas_960.jpg"))
}

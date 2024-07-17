//
//  AstronomyPictureViewModel.swift
//  AstronomyPicture
//
//  Created by Ummer on 17/07/24.
//

import Foundation

class AstronomyPictureViewModel: ObservableObject {
    
    @Published var astroPictures: [AstroPicture] = []
    @Published var loading = false
    var apiClient: AstronomyPictureAPIClient!
    private let api_base_url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2024-01-01&end_date=2024-02-01"
    
    init() {
        loading = true
        self.apiClient = AstronomyPictureAPIClient(networkingService: AstronomyGetPicturesNetworkService())
        getPictures()
    }
    func getPictures(){
        self.apiClient.getAstronomyPictures { result in
            DispatchQueue.main.async{
                switch result {
                case .success(let pictures):
                    self.astroPictures = pictures
                    self.loading = false
                case .failure(let error):
                    print(error)
                    self.loading = false
                }
                
            }
        }
    }
}

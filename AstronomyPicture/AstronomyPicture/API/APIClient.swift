//
//  APIClient.swift
//  AstronomyPicture
//
//  Created by Ummer on 17/07/24.
//

import Foundation

class AstronomyPictureAPIClient {
    private let networkingService: NetworkingService
    private let getPictures_url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2024-01-01&end_date=2024-02-01"
    
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    
    
    func getAstronomyPictures(completion: @escaping (Result<[AstroPicture], Error>) -> Void) {
        guard let url = URL(string: getPictures_url) else {
            return
        }
        networkingService.fetchData(url: url) { data, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            // Parsing the data into Astropicture Model
            if let data = data {
                do {
                    let pictures = try JSONDecoder().decode(Array<AstroPicture>.self, from: data)
                    completion(.success(pictures))
                } catch {
                    completion(.failure(error))
                }
            } else {
                let error = NSError(domain: "MockNetworkServiceErrorDomain", code: -1, userInfo: nil)
                completion(.failure(error))
            }
        }
    }
}

//
//  NetworkManager.swift
//  AstronomyPicture
//
//  Created by Ummer on 17/07/24.
//

import Foundation
import Combine

protocol NetworkingService {
    func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void)
}

class AstronomyGetPicturesNetworkService: NetworkingService {
    func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            completion(data, nil)
        }.resume()
    }
}

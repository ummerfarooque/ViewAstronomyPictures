//
//  AstroPicture.swift
//  AstronomyPicture
//
//  Created by Ummer on 17/07/24.
//

import Foundation

struct AstroPicture: Decodable, Identifiable {
    let id = UUID()
    var date: String
    var title: String
    var hdurl: String?
    var explanation: String
    var media_type: String
    var service_version: String
    var url: String
    var copyright: String?
}

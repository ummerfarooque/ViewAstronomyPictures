//
//  MockNetworkingService.swift
//  AstronomyPicture
//
//  Created by Shabz on 17/07/24.
//

import Foundation


class MockNetworkingService: NetworkingService {
    func fetchData(url: URL, completion: (Data?, Error?) -> Void) {
        let jsonString = """
           [
             {
                 "date": "2024-01-04",
                 "explanation": "Like a ship plowing through cosmic seas, runaway star Zeta Ophiuchi produces the arcing interstellar bow wave or bow shock seen in this stunning infrared portrait. In the false-color view, bluish Zeta Oph, a star about 20 times more massive than the Sun, lies near the center of the frame, moving toward the left at 24 kilometers per second. Its strong stellar wind precedes it, compressing and heating the dusty interstellar material and shaping the curved shock front. What set this star in motion? Zeta Oph was likely once a member of a binary star system, its companion star was more massive and hence shorter lived. When the companion exploded as a supernova catastrophically losing mass, Zeta Oph was flung out of the system.  About 460 light-years away, Zeta Oph is 65,000 times more luminous than the Sun and would be one of the brighter stars in the sky if it weren't surrounded by obscuring dust. The image spans about 1.5 degrees or 12 light-years at the estimated distance of Zeta Ophiuchi. In January 2020, NASA placed the Spitzer Space Telescope in safe mode, ending its 16 successful years of exploring the cosmos.",
                 "hdurl": "https://apod.nasa.gov/apod/image/2401/ZetaOph_spitzer_4015.jpg",
                 "media_type": "image",
                 "service_version": "v1",
                 "title": "Zeta Oph: Runaway Star",
                 "url": "https://apod.nasa.gov/apod/image/2401/ZetaOph_spitzer_960.jpg"
               }
           ]
        """
        if let data = jsonString.data(using: .utf8) {
            completion(data, nil)
        } else {
            let error = NSError(domain: "MockNetworkServiceErrorDomain", code: -1, userInfo: nil)
            completion(nil, error)
        }
    }
}
//
//  Places.swift
//  Travel
//
//  Created by Joyce Matos on 4/16/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

struct Place {
    
    let placeID: Int
    let iataCode: String
    let city: String
    let cityID: String
    let country: String
    
    // TODO: - Create init and check to see if it contains iataCode and cityname ; if not, do not use
    
}

// This extension allows us to keep our default initializer
extension Place {
    init(with JSON: JSON) {
        let placeID = JSON["PlaceId"] as! Int
        let iataCode = JSON["IataCode"] as! String
        let city = JSON["CityName"] as! String
        let cityID = JSON["CityId"] as! String
        let country = JSON["CountryName"] as! String
        
        self.placeID = placeID
        self.iataCode = iataCode
        self.city = city
        self.cityID = cityID
        self.country = country
    }
    
}

//
//  Constants.swift
//  Travel
//
//  Created by Joyce Matos on 4/24/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

struct SkyScannerAPI {
    
    static let baseURLString = "http://partners.api.skyscanner.net/apiservices/browseroutes/v1.0/"
    
    struct QuoteJSON {
        
        static let quoteID = "QuoteId"
        static let minPrice = "MinPrice"
        static let direct = "Direct"
        static let outbound = "OutboundLeg"
        static let carriers = "CarrierIds"
        static let originID = "OriginId"
        static let destinationID = "DestinationId"
        static let departureDate = "DepartureDate"
        static let inbound = "InboundLeg"
        static let quoteDate = "QuoteDateTime"

    }
    
    struct PlaceJSON {
        
        static let placeID = "PlaceId"
        static let iataCode = "IataCode"
        static let name = "Name"
        static let city = "CityName"
        static let cityID = "CityId"
        static let country = "CountryName"
        
    }
    
    
}

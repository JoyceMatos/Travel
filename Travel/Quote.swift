//
//  Quote.swift
//  Travel
//
//  Created by Joyce Matos on 4/24/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

// TODO: - Add origin label
// TODO: - Find departure time
// TODO: - Add origin city, country, airline

struct Quote {
    
    let quoteID: Int
    let minPrice: Int
    let direct: Bool
    
    let outboundCarriers: [Int]
    let outboundOriginID: Int
    let outboundOriginCity: String
    let outboundOriginIata: String
    let outboundDestinationID: Int
    let outboundDestinationCity: String
    let outboundDestinationIata: String
    let outboundDepartureDate: String
    
    let inboundCarriers: [Int]
    let inboundOriginID: Int
    let inboundOriginCity: String
    let inboundOriginIata: String
    let inboundDestinationID: Int
    let inboundDestinationName: String
    let inboundDestinationIata: String
    let inboundDepartureDate: String
    
    // TODO: - Add actual flight info. ie: Origin name, airport, etc.
    
    init(JSON: [String: Any]) {
        let outbound = JSON[SkyScannerAPI.QuoteJSON.outbound] as! [String: Any]
        let inbound = JSON[SkyScannerAPI.QuoteJSON.inbound] as! [String: Any]

        self.quoteID = JSON[SkyScannerAPI.QuoteJSON.quoteID] as! Int
        self.minPrice = JSON[SkyScannerAPI.QuoteJSON.minPrice] as! Int
        self.direct = JSON[SkyScannerAPI.QuoteJSON.direct] as! Bool
        
        self.outboundCarriers = outbound[SkyScannerAPI.QuoteJSON.carriers] as! [Int]
        self.outboundOriginID = outbound[SkyScannerAPI.QuoteJSON.originID] as! Int        
        
        
        self.outboundDestinationID = outbound[SkyScannerAPI.QuoteJSON.destinationID] as! Int
        self.outboundDepartureDate = outbound[SkyScannerAPI.QuoteJSON.departureDate] as! String
        
        self.inboundCarriers = inbound[SkyScannerAPI.QuoteJSON.carriers] as! [Int]
        self.inboundOriginID = inbound[SkyScannerAPI.QuoteJSON.originID] as! Int
        self.inboundDestinationID = inbound[SkyScannerAPI.QuoteJSON.destinationID] as! Int
        self.inboundDepartureDate = inbound[SkyScannerAPI.QuoteJSON.departureDate] as! String

    }
    
    
    
}

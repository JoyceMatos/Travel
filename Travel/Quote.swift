//
//  Quote.swift
//  Travel
//
//  Created by Joyce Matos on 4/24/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

struct Quote {
    
    let quoteID: Int
    let minPrice: Int
    let direct: Bool
    let outboundCarriers: [Int]
    let outboundOriginID: Int
    let outboundDestinationID: Int
    let outboundDepartureDate: String
    let inboundCarriers: [Int]
    let inboundOriginID: Int
    let inboundDestinationID: Int
    let inboundDepartureDate: String
    let quoteDate: String
    
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
        self.quoteDate = JSON[SkyScannerAPI.QuoteJSON.quoteDate] as! String
        
    }
    
    
    
}

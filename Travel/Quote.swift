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
// TODO: - Naming convention

final class Flight {
    
    var quoteID: Int    // Debatable property
    var minPrice: Int
    var direct: Bool
    
    // TODO: - Outbound/inbound can be a dictionaries
    
    var outboundCarriers: [Int]
    var outboundAirlines: [String]?
    var outboundOriginID: Int       // Debatable property
    var outboundOriginCity: String?
    var outboundOriginIata: String?
    var outboundOriginCountry: String?
    var outboundDestinationID: Int      // Debatable property
    var outboundDestinationCity: String?
    var outboundDestinationIata: String?
    var outboundDestinationCountry: String?
    var outboundDepartureDate: String
    
    var inboundCarriers: [Int]
    var inboundAirlines: [String]?
    var inboundOriginID: Int        // Debatable property
    var inboundOriginCity: String?
    var inboundOriginIata: String?
    var inboundOriginCountry: String?
    var inboundDestinationID: Int       // Debatable property
    var inboundDestinationCity: String?
    var inboundDestinationIata: String?
    var inboundDestinationCountry: String?
    var inboundDepartureDate: String
        
    init(JSON: [String: Any]) {
        let outbound = JSON["OutboundLeg"] as! [String: Any]
        let inbound = JSON["InboundLeg"] as! [String: Any]

        self.quoteID = JSON[SkyScannerAPI.QuoteJSON.quoteID] as! Int
        self.minPrice = JSON[SkyScannerAPI.QuoteJSON.minPrice] as! Int
        self.direct = JSON[SkyScannerAPI.QuoteJSON.direct] as! Bool
        
        self.outboundCarriers = outbound[SkyScannerAPI.QuoteJSON.carriers] as! [Int]
        self.outboundOriginID = outbound["OriginId"] as! Int
        print("In initializing \(self.outboundOriginID)")
        
        self.outboundDestinationID = outbound["DestinationId"] as! Int
        self.outboundDepartureDate = outbound[SkyScannerAPI.QuoteJSON.departureDate] as! String
        
        self.inboundCarriers = inbound[SkyScannerAPI.QuoteJSON.carriers] as! [Int]
        self.inboundOriginID = inbound["OriginId"] as! Int
        
        print("SECOND INIT \(inboundOriginID)")
            
        self.inboundDestinationID = inbound["DestinationId"] as! Int
        self.inboundDepartureDate = inbound[SkyScannerAPI.QuoteJSON.departureDate] as! String

    }
    
}

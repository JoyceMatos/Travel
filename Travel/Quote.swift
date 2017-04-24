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
    let outboundCarrier: String
    let outboundOriginID: String
    let outboundDestinationID: String
    let outboundDepartureDate: String
    let inboundCarrier: String
    let inboundOriginID: String
    let inboundDestinationID: String
    let inboundDepartureDate: String
    let quoteDate: String
    
    init(JSON: [String: Any]) {
        
        self.quoteID = JSON[SkyScannerAPI.QuoteJSON.quoteID] as! Int
        self.minPrice = JSON[SkyScannerAPI.QuoteJSON.minPrice] as! Int
        self.direct = JSON[SkyScannerAPI.QuoteJSON.direct] as! Bool
    //    self.outboundCarrier = JSON[SkyScannerAPI.QuoteJSON.outbound] as! Int



    
        
        
        
    }
    
}

//
//  Quote.swift
//  Travel
//
//  Created by Joyce Matos on 4/24/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

struct Quote {
    
    let quoteID: String?
    let minPrice: Int?
    let direct: Bool
    let outbound: [String: Int]
    let outboundOriginID: String
    let outboundDestinationID: String
    let outboundDepartureDate: String
    let inbound: [String: Int]
    let inboundOriginID: String
    let inboundDestinationID: String
    let inboundDepartureDate: String
    let quoteDate: String
    
}

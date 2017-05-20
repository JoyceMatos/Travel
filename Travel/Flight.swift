//
//  Flight.swift
//  Travel
//
//  Created by Joyce Matos on 5/1/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

// NOTE: - Information needed for display
// TODO: - Add inbound carriers and outbound carriers

struct Flight {
    
    let inboundOrigin: Place?
    let inboundDestination: Place?
    let outboundOrigin: Place?
    let outboundDestination: Place?
    let price: Int
    let direct: Bool
    let outboundAirlines: [Carrier]?
    let inboundAirlines: [Carrier]?
    let outboundDepartureDate: String
    let inboundDepartureDate: String
    
}

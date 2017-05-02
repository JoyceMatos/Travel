//
//  Flight.swift
//  Travel
//
//  Created by Joyce Matos on 5/1/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

// NOTE: - Information needed for display

struct Flight {
    
    let destination: Place
    let quote: Int
    let direct: Bool
    let airlines: [Carrier]
    let outboundDepartureDate: String
    let inboundDepartureDate: String
    
}

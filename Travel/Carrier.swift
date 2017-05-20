//
//  Flight.swift
//  Travel
//
//  Created by Joyce Matos on 4/20/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

struct Carrier {
    
    let carrierID: Int
    let name: String
    
    init(with JSON: JSON) {
        let carrerID = JSON["CarrierId"] as! Int
        let name = JSON["Name"] as! String
        
        self.carrierID = carrierID
        self.name = name
    }
    
    
    
}

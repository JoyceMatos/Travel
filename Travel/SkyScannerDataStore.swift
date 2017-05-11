//
//  SkyScannerDS.swift
//  Travel
//
//  Created by Joyce Matos on 3/31/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

final class SkyScannerDataStore {
    
    static let shared = SkyScannerDataStore()
   // var flightRoutes = [[String: Any]]()
    var flightQuotes = [Quote]()
    
    private init() {}
    
    // TODO: - Create Places objects and Carrier objects OR Incorporate all these details in one flight object.
    // TODO: - Remove async method
    
    func retriveFlights(_ budget: Int) {
        flightQuotes.removeAll()
        
     //   let quotesQueue = DispatchQueue.global()
        SkyScannerAPIClient.getQuotes { (JSON) in
            
            guard let quotes = JSON["Quotes"] as? [[String: Any]],
                let places = JSON["Places"] as? [[String: Any]],
                let carriers = JSON["Carriers"] as? [[String: Any]] else {
                    return
            }
            
            for quote in quotes {
                guard let value = quote["MinPrice"] as? Int else { // NOTE: - Sometimes breaks here
                    return
                }
                
             //   quotesQueue.async {
                    if value <= budget {
                        let cheapestFlight = Quote(JSON: quote) // NOTE: - Sometimes breaks here
                        self.flightQuotes.append(cheapestFlight)
                    }
                }
                
           // }
            print("These are the quotes: \(self.flightQuotes.count)")
        }
        
    }
    
    
    
}

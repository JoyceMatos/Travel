//
//  SkyScannerDS.swift
//  Travel
//
//  Created by Joyce Matos on 3/31/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

// TODO: - Get departure time
// TODO: - Delete array of objects that aren't in use

final class SkyScannerDataStore {
    
    static let shared = SkyScannerDataStore()
   // var flightRoutes = [[String: Any]]()
    var flightQuotes = [Quote]()
    var flights = [Flight]
    
    private init() {}
    
    // TODO: - Create Places objects and Carrier objects OR Incorporate all these details in one flight object.
    // TODO: - Remove async method
    
    func retriveFlights(_ budget: Int) {
        flightQuotes.removeAll()
        
        let quotesQueue = DispatchQueue.global()
        quotesQueue.async {

        SkyScannerAPIClient.getQuotes { (JSON) in
            guard let quotes = JSON["Quotes"] as? [[String: Any]],
                let places = JSON["Places"] as? [[String: Any]],
                let carriers = JSON["Carriers"] as? [[String: Any]] else {
                    return
            }
            
            let airlines = get(carriers)
            let locations = get(places)
            
            for quote in quotes {
                guard let value = quote["MinPrice"] as? Int else { // NOTE: - Sometimes breaks here
                    return
                }
                    if value <= budget {
                        let cheapestFlight = Quote(JSON: quote) // NOTE: - Sometimes breaks here
                        self.flightQuotes.append(cheapestFlight)
                    }
                }
                
            }
            print("These are the quotes: \(self.flightQuotes.count)")
        }
        
    }
    
    
    // TODO: - These two functions can be generics (Carriers and Places)
    
    func get(_ carriers: [JSON]) -> [Carrier] {
        var airlines = [Carrier]()
        
        for json in carriers {
            let carrier = Carrier(with: json)
            airlines.append(carrier)
        }
        
        return airlines
    }
    
    func get(_ places: [JSON]) -> [Place] {
        var locations = [Place]
        
        for json in places {
            let place = Place(with: json)
            locations.append(place)
        }
        
        return locations
    }
    
    func createFlights(from quotes: [Quote], for places: [Place], and airlines: [Carrier]) -> [Flight] {
        
        for quote in quotes {
           places.filter(<#T##isIncluded: (Place) throws -> Bool##(Place) throws -> Bool#>)
            
        }
        
        
        
        
    }
    
    
    
}

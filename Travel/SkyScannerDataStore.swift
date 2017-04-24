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
    var flightRoutes = [[String: Any]]()
    var flightQuotes = [Quote]()
    
    private init() {}
    
    func retriveFlights(_ budget: Int) {
        flightQuotes.removeAll()
        
        let quotesQueue = DispatchQueue.global()
        SkyScannerAPIClient.getQuotes { (JSON) in
            
            guard let quotes = JSON["Quotes"] as? [[String: Any]],
                let places = JSON["Places"] as? [[String: Any]],
                let carriers = JSON["Carriers"] as? [[String: Any]] else {
                    return
            }
            
            for quote in quotes {
                guard let value = quote["MinPrice"] as? Int else {
                    return
                }
                
                quotesQueue.async {
                    if value <= budget {
                        let cheapestFlight = Quote(JSON: quote)
                        self.flightQuotes.append(cheapestFlight)
                    }
                }
                
            }
            print("These are the quotes: \(self.flightQuotes.count)")
        }
        
    }
    
//    func retrieveAllRoutes(_ budget: Int, completion: @escaping ([[String: Any]]) -> Void) {
//        flightRoutes.removeAll()
//        
//        let routeQueue = DispatchQueue.global()
//        
//        SkyScannerAPIClient.getFlights { (JSON) in
//            
//            guard let routes = JSON["Routes"] as? [[String: Any]],
//                let places = JSON["Places"] as? [[String: Any]],
//                let carriers = JSON["Carriers"] as? [[String: Any]] else {
//                    return
//            }
//            
//            for route in routes {
//                
//                guard let value = route["Price"] as? Int else {
//                    return
//                }
//
//                routeQueue.async {
//                    if value <= budget {
//                        self.flightRoutes.append(route)
//                        
//                    }
//                    
//                }
//            }
//            completion(self.flightRoutes)
//        }
//    }
//    
    
    
}

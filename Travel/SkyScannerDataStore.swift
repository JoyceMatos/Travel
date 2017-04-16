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
    var flightQuotes = [[String: Any]]()
    var flightRoutes = [[String: Any]]()
    
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
                    
                    print("Quote: \(quote)")
                    quotesQueue.async {

                    if value <= budget {
                        self.flightQuotes.append(quote)
                        
                    }
                }
                    
            }
                print("These are the quotes: \(self.flightQuotes)")
        }
        
    }
    
    func retrieveAllRoutes(_ budget: Int, completion: @escaping ([[String: Any]]) -> Void) {
        flightRoutes.removeAll()
        
        let routeQueue = DispatchQueue.global()

        SkyScannerAPIClient.getFlights { (JSON) in
            
            guard let routes = JSON["Routes"] as? [[String: Any]],
                let places = JSON["Places"] as? [[String: Any]],
                let carriers = JSON["Carriers"] as? [[String: Any]] else {
                    return
            }

            for route in routes {
                
                guard let value = route["Price"] as? Int else {
                    return
                }
            //    print(value)

            //    print("Route: \(route)")
                routeQueue.async {

                
                    if value <= budget {
                        self.flightRoutes.append(route)
                        
                    }
                
        }
            

            
            
            
            
            
        }
        
            completion(self.flightRoutes)

        }
        
        
    }
}

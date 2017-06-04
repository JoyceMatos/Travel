//
//  SkyScannerDS.swift
//  Travel
//
//  Created by Joyce Matos on 3/31/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

// TODO: - Get departure time
// TODO: - Do you want to use objects or direct data parsing? (Essentially you are storing same info in diff places by using objects)
// TODO: - Work on async calls

final class SkyScannerDataStore {
    
    static let shared = SkyScannerDataStore()
    var flightQuotes = [Quote]()
    var flightViewModels: [FlightViewModel]?
    
    private init() {}
    
    // TODO: - Create Places objects and Carrier objects OR Incorporate all these details in one flight object.
    // TODO: - Remove async method
    
    func retrieve(airline carriers: [JSON]) -> [Carrier] {
        var airlines = [Carrier]()
        
        for json in carriers {
            let carrier = Carrier(with: json)
            airlines.append(carrier)
        }
        
        return airlines
    }
    
    func retrieve(_ places: [JSON]) -> [Place] {
        var locations = [Place]()
        
        for json in places {
            
            if json["IataCode"] == nil {
                continue
            }
            
            let place = Place(with: json)
            locations.append(place)
        }
        
        return locations
    }
    
    
    func retriveFlights(_ budget: Int, completion: @escaping (Bool) -> Void) {
        
        var outboundOriginCity = String()
        var outboundCountry = String()
        var outboundIata = String()
        var outboundDestinationCity = String()
        var outboundDestinationCountry = String()
        var outboundDestinationIata = String()
        var inboundOriginCity = String()
        var inboundOriginCountry = String()
        var inboundOriginIata = String()
        var inboundDestinationCity = String()
        var inboundDestinationCountry = String()
        var inboundDestinationIata = String()
        
        flightQuotes.removeAll()
        
        let quotesQueue = DispatchQueue.global()
        quotesQueue.async {
            
            SkyScannerAPIClient.getQuotes { (JSON) in
                guard let quotes = JSON["Quotes"] as? [[String: Any]],
                    let places = JSON["Places"] as? [[String: Any]],
                    let carriers = JSON["Carriers"] as? [[String: Any]] else {
                        completion(false)
                        return
                }
                
                let airlines = self.retrieve(airline: carriers)
                let locations = self.retrieve(places)
                
                for quote in quotes {
                    guard let value = quote["MinPrice"] as? Int else { // NOTE: - Sometimes breaks here
                        completion(false)
                        return
                    }
                    
                    if value <= budget {
                        var cheapestFlight = Quote(JSON: quote) // NOTE: - Sometimes breaks here
                        self.flightQuotes.append(cheapestFlight)
                    }
                }
                
                for flight in self.flightQuotes {
                    print("FLight")
                    for location in locations {
                        if flight.outboundOriginID == location.placeID {
                            flight.outboundOriginCity = location.city
                            flight.outboundOriginCountry = location.country
                            flight.outboundOriginIata = location.iataCode
                        }
                        
                        if flight.outboundDestinationID == location.placeID {
                            flight.outboundDestinationCity = location.city
                            flight.outboundDestinationCountry = location.country
                            flight.outboundDestinationIata = location.iataCode
                        }
                        
                        if flight.inboundOriginID == location.placeID {
                            flight.inboundOriginCity = location.city
                            flight.inboundOriginCountry = location.country
                            flight.inboundOriginIata = location.iataCode
                        }
                        
                        if flight.inboundDestinationID == location.placeID {
                            flight.inboundDestinationCity = location.city
                            flight.inboundDestinationCountry = location.country
                            flight.inboundDestinationIata = location.iataCode
                        }
                        
                    }
                    
                    for airline in airlines {
                        
                        if flight.inboundCarriers.contains(airline.carrierID) {
                            // TODO: - This might override previous values
                            flight.inboundAirlines = [airline.name]
                        }
                        
                        if flight.outboundCarriers.contains(airline.carrierID) {
                            flight.outboundAirlines = [airline.name]
                        }
                    }
                    
                    
                }
                
                // Populate view model array
                // TODO: - This logic has to be separated
                
                for quote in self.flightQuotes {
                    let flight = FlightViewModel(quote: quote)
                    self.flightViewModels?.append(flight)
                }
        
                print("These are the quotes: \(self.flightQuotes.count)")
                completion(true)
                
            }
            
        }
        
    }
    
    
    
    
    
    
}

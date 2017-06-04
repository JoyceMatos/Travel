//
//  FlightCellViewModel.swift
//  Travel
//
//  Created by Joyce Matos on 5/19/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation

// TODO: - Naming convention for file/class

struct FlightViewModel {
    
    let store = SkyScannerDataStore.shared
    
    private var quote: Quote?
    // Quote properties 
    
    var outboundCarriers: [Int]? {
        return quote?.outboundCarriers
    }
    var outboundAirlines: [String]? {
        return quote?.outboundAirlines
    }
    
    var outboundOriginID: Int? {
        return quote?.outboundOriginID
    }
    var outboundOriginCity: String? {
        return quote?.outboundOriginCity
    }
    
    var outboundOriginIata: String? {
        return quote?.outboundOriginIata
    }
    
    var outboundOriginCountry: String? {
        return quote?.outboundOriginCountry
    }
    
    var outboundDestinationID: Int? {
        return quote?.outboundDestinationID
    }
    
    var outboundDestinationCity: String? {
        return quote?.outboundDestinationCity
    }
    var outboundDestinationIata: String? {
        return quote?.outboundDestinationIata
    }
    var outboundDestinationCountry: String? {
        return quote?.outboundDestinationCountry
    }
    
    var outboundDepartureDate: String? {
        return quote?.outboundDepartureDate
    }
    
    var inboundCarriers: [Int]? {
        return quote?.inboundCarriers
    }
    var inboundAirlines: [String]? {
        return quote?.inboundAirlines
    }
    var inboundOriginID: Int? {
        return quote?.inboundOriginID
    }
    var inboundOriginCity: String? {
        return quote?.inboundOriginCity
    }
    var inboundOriginIata: String? {
        return quote?.outboundOriginIata
    }
    var inboundOriginCountry: String? {
        return quote?.outboundOriginCountry
    }
    var inboundDestinationID: Int? {
        return quote?.inboundDestinationID
    }
    var inboundDestinationCity: String? {
        return quote?.inboundDestinationCity
    }
    var inboundDestinationIata: String? {
        return quote?.inboundDestinationIata
    }
    var inboundDestinationCountry: String? {
        return quote?.inboundDestinationCountry
    }
    var inboundDepartureDate: String? {
        return quote?.inboundDepartureDate
        }
    
    init(quote: Quote) {
        self.quote = quote
        
    }
    
    // These get called in tableView ie: viewModel.numberOfSections(in section)
    func numberOfSections(in section: Int) -> Int {
        return store.flightQuotes.count
    }
    
    func titleForRow(at indexPath: IndexPath) -> String {
        // TODO: - Check force casting
        let destinationCity = store.flightQuotes[indexPath.row].outboundDestinationCity as! String
        return destinationCity
    }
    
    func fetchFlight(with budget: Int, completion: @escaping (Bool) -> Void) {
        store.retriveFlights(budget) { (success) in
            if success {
                completion(true)
                // Do something
            } else {
                completion(false)
                // Handle this
            }
        }
        
    }

    
}

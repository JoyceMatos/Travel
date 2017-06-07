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
    
    private var flight: Flight?
    // Quote properties 
    
    var outboundCarriers: [Int]? {
        return flight?.outboundCarriers
    }
    var outboundAirlines: [String]? {
        return flight?.outboundAirlines
    }
    
    var outboundOriginID: Int? {
        return flight?.outboundOriginID
    }
    var outboundOriginCity: String? {
        return flight?.outboundOriginCity
    }
    
    var outboundOriginIata: String? {
        return flight?.outboundOriginIata
    }
    
    var outboundOriginCountry: String? {
        return flight?.outboundOriginCountry
    }
    
    var outboundDestinationID: Int? {
        return flight?.outboundDestinationID
    }
    
    var outboundDestinationCity: String? {
        return flight?.outboundDestinationCity
    }
    var outboundDestinationIata: String? {
        return flight?.outboundDestinationIata
    }
    var outboundDestinationCountry: String? {
        return flight?.outboundDestinationCountry
    }
    
    var outboundDepartureDate: String? {
        return flight?.outboundDepartureDate
    }
    
    var inboundCarriers: [Int]? {
        return flight?.inboundCarriers
    }
    var inboundAirlines: [String]? {
        return flight?.inboundAirlines
    }
    var inboundOriginID: Int? {
        return flight?.inboundOriginID
    }
    var inboundOriginCity: String? {
        return flight?.inboundOriginCity
    }
    var inboundOriginIata: String? {
        return flight?.outboundOriginIata
    }
    var inboundOriginCountry: String? {
        return flight?.outboundOriginCountry
    }
    var inboundDestinationID: Int? {
        return flight?.inboundDestinationID
    }
    var inboundDestinationCity: String? {
        return flight?.inboundDestinationCity
    }
    var inboundDestinationIata: String? {
        return flight?.inboundDestinationIata
    }
    var inboundDestinationCountry: String? {
        return flight?.inboundDestinationCountry
    }
    var inboundDepartureDate: String? {
        return flight?.inboundDepartureDate
        }
    
    init(flight: Flight) {
        self.flight = flight
        
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

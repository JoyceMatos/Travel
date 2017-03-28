//
//  SkyScannerAPIClient.swift
//  Travel
//
//  Created by Joyce Matos on 3/28/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import Foundation
import Alamofire


class SkyScannerAPIClient {
    
    class func getFlights(budget amount: Int, completion: () -> Void) {
        
        // Browse Routes
        
        Alamofire.request("http://partners.api.skyscanner.net/apiservices/browseroutes/v1.0/US/usd/en-US/us/anywhere/anytime/anytime?apikey=" + skyScannerAPIKey).responseJSON { (response) in
            
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
        }
        
        
        
    }
    
    
    
}

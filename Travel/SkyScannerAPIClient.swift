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
    
    // TODO: - Handle Errors
    // TODO: - Edit base URL so that you can add inputs based on origin Airport, Country, Etc.
    
    class func getQuotes(completion: @escaping ([String: Any]) -> Void) {
        Alamofire.request(SkyScannerAPI.baseURLString + "US/usd/en-US/us/anywhere/anytime/anytime?apikey=" + skyScannerAPIKey).responseJSON { (response) in
            
            //            print(response.request)  // original URL request
            //            print(response.response) // HTTP URL response
            //            print(response.data)     // server data
            //            print(response.result)   // result of response serialization
            
            
            if let JSON = response.result.value as? [String: Any] {
                print("JSON: \(JSON)")
                completion(JSON)

            }
        }
    }
    
    
    
}

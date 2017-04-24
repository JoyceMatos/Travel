//
//  ViewController.swift
//  Travel
//
//  Created by Joyce Matos on 3/28/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SkyScannerDataStore.shared.retriveFlights(500)

    }
}


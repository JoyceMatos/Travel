//
//  FlightVC.swift
//  Travel
//
//  Created by Joyce Matos on 5/12/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit

class FlightVC: UIViewController {

    let tableView = FlightTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constrain()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func constrain() {
        
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.width.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.8)
        }
    }

}

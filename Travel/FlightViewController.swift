//
//  FlightVC.swift
//  Travel
//
//  Created by Joyce Matos on 5/12/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit

// TODO: - Seperate view model logic


class FlightViewController: UIViewController {

    // TODO: - Separate logic
    let store = SkyScannerDataStore.shared
    
    let tableView = UITableView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(button)
        view.addSubview(tableView)
        
        tableView.backgroundColor = UIColor.cyan
        button.backgroundColor = UIColor.blue

        
        tableView.register(FlightCell.self, forCellReuseIdentifier: "flightCell")
        
        constrain()
        
        self.store.retriveFlights(500) { (success) in
            if success {
                    print("Yay")
                    self.tableView.reloadData()
                }
            }
    }


    func constrain() {
        
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.centerX.width.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.8)
        }
        
        button.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            
        }
        
    }

}

extension FlightViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.flightQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell", for: indexPath) as! FlightCell
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentCell = cell as! FlightCell
        let quote = store.flightQuotes[indexPath.row]
        
        // TODO: - Find out how to seperate functionality to view model
        currentCell.quote = quote
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


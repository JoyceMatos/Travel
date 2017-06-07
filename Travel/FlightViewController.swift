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
    
    let tableView = UITableView()
    
    // TODO: - Separate logic
    let store = SkyScannerDataStore.shared
    var viewModel: FlightViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.cyan
        tableView.register(FlightCell.self, forCellReuseIdentifier: "flightCell")
        
        constrainViews()
        
        self.store.retriveFlights(500) { (success) in
            if success {
                    print("Yay")
                    self.tableView.reloadData()
                }
            }
        
//        viewModel?.fetchFlight(with: 500, completion: { (success) in
//            DispatchQueue.main.async {
//            self.tableView.reloadData()
//            print("Reloaded")
//            }
//        })

    }


    func constrainViews() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.centerX.width.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.8)
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
      //  configureCell(cell, forRowAt: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentCell = cell as! FlightCell
        let flight = store.flightQuotes[indexPath.row]
        
        // TODO: - Find out how to seperate functionality to view model
        currentCell.flight = flight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to detailView
        
    }
    
    // TODO: - Work on this
    func configureCell(_ cell: UITableViewCell, forRowAt indexPath: IndexPath ) {
        cell.textLabel?.text = viewModel?.titleForRow(at: indexPath)
    }
    
}


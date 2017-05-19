//
//  FlightVC.swift
//  Travel
//
//  Created by Joyce Matos on 5/12/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit

class FlightViewController: UIViewController {

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
        // Do any additional setup after loading the view.
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell", for: indexPath) as! FlightCell
        
        print("Yes lets use this cell!")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


//
//  FlightTableView.swift
//  Travel
//
//  Created by Joyce Matos on 5/12/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit

class FlightTableView: UIView {

   let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constrain() {
        tableView.snp.makeConstraints {
            $0.centerX.centerY.height.width.equalToSuperview()
        }
    }
    
}

// Does this go here?
extension FlightTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! FlightCell
        
       // cell.destinationLabel = "J"
        
        return cell
    }
    
}

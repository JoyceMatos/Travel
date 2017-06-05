//
//  HomeViewController.swift
//  Travel
//
//  Created by Joyce Matos on 6/3/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit
import SnapKit

// TODO: - Add Navigation Controller

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        constrain()
    }
    
    func constrain() {
       view.addSubview(homeView)
        
        homeView.snp.makeConstraints {
            $0.height.width.centerX.centerY.equalToSuperview()
        }
    }
    
    // TODO: - Separate logic
    
    func addTargets() {
        homeView.flightView.addTarget(self, action: #selector(segueToFLightVC), for: .touchUpInside)
        
    }
    
    func segueToFLightVC() {
        present(FlightViewController(), animated: true, completion: nil)
        
        
    }
    
    
    
}

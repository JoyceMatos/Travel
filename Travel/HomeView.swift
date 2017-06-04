//
//  HomeView.swift
//  Travel
//
//  Created by Joyce Matos on 6/3/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit

// TODO: - private/fileprivates
// TODO: - Make collection view instead

class HomeView: UIView {

    var flightView: UIButton = {
        let flightView = UIButton()
        flightView.backgroundColor = UIColor.gray
        return flightView
    }()
    
    var stayView: UIButton = {
        let stayView = UIButton()
        stayView.backgroundColor = UIColor.darkGray
        return stayView
    }()
    
    var activityView: UIButton = {
        let activityView = UIButton()
        activityView.backgroundColor = UIColor.black
        return activityView
    }()
    
    var flightLabel: UILabel = {
        let flightLabel = UILabel()
        flightLabel.font = UIFont(name: "Avenir", size: 12)
        flightLabel.textColor = UIColor.white
        return flightLabel
    }()
    
    var stayLabel: UILabel = {
        let stayLabel = UILabel()
        stayLabel.textColor = UIColor.white
        return stayLabel
    }()
    
    var activityLabel: UILabel = {
        let activityLabel = UILabel()
        activityLabel.textColor = UIColor.white
        return activityLabel
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constrain() {

        addSubview(flightView)
        addSubview(stayView)
        addSubview(activityView)
        addSubview(flightLabel)
        stayView.addSubview(stayLabel)
        activityView.addSubview(activityLabel)

        
        // TODO: - Condense
        // TODO: - Work on label constraints
        
        // Views
        flightView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.25)
            $0.width.equalToSuperview().multipliedBy(0.9)
        }
        
        stayView.snp.makeConstraints {
            $0.top.equalTo(flightView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(flightView)
        }
        
        activityView.snp.makeConstraints {
            $0.top.equalTo(stayView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(flightView)
        }
        
        // Labels
//        flightLabel.snp.makeConstraints {
//            $0.centerX.centerY.equalTo(flightView)
//        }
//        
//        stayLabel.snp.makeConstraints {
//            $0.centerX.centerY.equalToSuperview()
//        }
//        
//        flightLabel.snp.makeConstraints {
//            $0.centerX.centerY.equalToSuperview()
//        }
//        
        
        
        
    }
    
    func configureLabels() {
        flightLabel.text = "Flights"
        stayLabel.text = "Stay"
        activityLabel.text = "Activity"
    }
    


}

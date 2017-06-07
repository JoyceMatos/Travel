//
//  FlightCell.swift
//  Travel
//
//  Created by Joyce Matos on 5/11/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit
import SnapKit

// TODO: - Rename properties


class FlightCell: UITableViewCell {
    
    var destinationLabel = UILabel()
    var priceLabel = UILabel()
    var directLabel = UILabel()
    var datesLabel = UILabel()
    var outboundDestAirlineLabel = UILabel()
    var outboundOriginAirlineLabel = UILabel()
    var outboundDepartTimeLabel = UILabel()
    var outboundArrivalTimeLabel = UILabel()
    var outboundOriginAirportLabel = UILabel()
    var outboundDestAirportLabel = UILabel()
    var inboundDestAirlineLabel = UILabel()
    var inboundOriginAirlineLabel = UILabel()
    var inboundDepartTimeLabel = UILabel()
    var inboundArrivalTimeLabel = UILabel()
    var inboundOriginAirportLabel = UILabel()
    var inboundDestAirportLabel = UILabel()
    
    var flight: Flight? {
        didSet {
            configureLabels()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLabels()
        constrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureLabels() {
        
        guard let price = flight?.minPrice,
            let direct = flight?.direct else {
                // Handle
                return
        }
        
        destinationLabel.text =  flight?.outboundDestinationCity
        priceLabel.text = "$\(price)"
        directLabel.text = direct ? "Non-stop" : "Stops"   // TODO: - Change to Non-stop or stops
        // dates.text = quote?.outboundDepartureDate + quote?.outboundDepartureDate // TODO: - format
        
        outboundDestAirlineLabel.text = flight?.outboundAirlines?.description // TODO: - Show each
        outboundOriginAirlineLabel.text = flight?.outboundAirlines?.description // TODO: - Show each
        outboundDepartTimeLabel.text = ""
        outboundArrivalTimeLabel.text = ""
        outboundOriginAirportLabel.text = flight?.outboundOriginIata // TODO: - get airport name
        outboundDestAirportLabel.text = flight?.outboundDestinationIata //TODO: - get airport name
        
        inboundDestAirlineLabel.text = flight?.inboundAirlines?.description
        inboundDepartTimeLabel.text = ""
        inboundArrivalTimeLabel.text  = ""
        inboundOriginAirportLabel.text = flight?.inboundOriginIata // TODO: - get airport name
        inboundDestAirportLabel.text = flight?.inboundDestinationIata // TODO: - Get airport name
        
    }
    
    func constrain() {
        self.contentView.addSubview(destinationLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(directLabel)
        self.contentView.addSubview(datesLabel)
        self.contentView.addSubview(outboundDestAirlineLabel)
        self.contentView.addSubview(outboundDepartTimeLabel)
        self.contentView.addSubview(outboundArrivalTimeLabel)
        self.contentView.addSubview(outboundOriginAirportLabel)
        self.contentView.addSubview(outboundDestAirportLabel)
        self.contentView.addSubview(inboundDestAirlineLabel)
        self.contentView.addSubview(inboundDepartTimeLabel)
        self.contentView.addSubview(inboundArrivalTimeLabel)
        self.contentView.addSubview(inboundOriginAirportLabel)
        self.contentView.addSubview(inboundDestAirportLabel)
        
        priceLabel.textAlignment = .right
        directLabel.textAlignment = .right
        
        destinationLabel.textColor = UIColor.black
        priceLabel.textColor = UIColor.black
        outboundDestAirlineLabel.textColor = UIColor.darkGray
        outboundOriginAirportLabel.textColor = UIColor.black
        directLabel.textColor = UIColor.blue
        
        destinationLabel.font.withSize(14)
        priceLabel.font.withSize(12)
        outboundDestAirlineLabel.font.withSize(12)
        outboundOriginAirportLabel.font.withSize(12)
        directLabel.font.withSize(12)
        
        // TODO: - Condense contraints
        
        destinationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        outboundDestAirlineLabel.snp.makeConstraints {
            $0.top.equalTo(destinationLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        outboundOriginAirportLabel.snp.makeConstraints {
            $0.top.equalTo(outboundDestAirlineLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        //        outboundDestAirlineLabel.snp.makeConstraints {
        //            $0.top.equalTo(outboundOriginAirlineLabel)
        //            $0.trailing.equalToSuperview().inset(20)
        //            $0.height.equalTo(outboundOriginAirportLabel).multipliedBy(0.2)
        //            $0.width.equalTo(outboundOriginAirportLabel).multipliedBy(0.1)
        //        }
        
        inboundDestAirlineLabel.snp.makeConstraints {
            $0.top.equalTo(outboundOriginAirportLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        
        inboundDestAirportLabel.snp.makeConstraints {
            $0.top.equalTo(inboundDestAirlineLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        
        //        inboundCarrierLabel.snp.makeConstraints {
        //            $0.top.equalTo(inboun.snp.bottom)
        //            $0.leading.equalToSuperview().inset(20)
        //            $0.height.equalToSuperview().multipliedBy(0.2)
        //            $0.width.equalToSuperview().multipliedBy(0.4)
        //        }
        //
        
        directLabel.snp.makeConstraints {
            $0.top.equalTo(outboundDestAirlineLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        
    }
    
    override func prepareForReuse() {
        destinationLabel.text = nil
        outboundDestAirlineLabel.text = nil
        outboundOriginAirportLabel.text = nil
    }
    
}

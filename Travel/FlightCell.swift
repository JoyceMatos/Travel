//
//  FlightCell.swift
//  Travel
//
//  Created by Joyce Matos on 5/11/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit
import SnapKit

// TODO: - Assign identifier
class FlightCell: UITableViewCell {
    
    var destinationLabel = UILabel()
    var priceLabel = UILabel()
    var directLabel = UILabel()
    var datesLabel = UILabel()
    var outboundCarrierLabel = UILabel()
    var outboundDepartTimeLabel = UILabel()
    var outboundArrivalTimeLabel = UILabel()
    var outboundOriginAirportLabel = UILabel()
    var outboundDestAirportLabel = UILabel()
    var inboundCarrierLabel = UILabel()
    var inboundDepartTimeLabel = UILabel()
    var inboundArrivalTimeLabel = UILabel()
    var inboundOriginAirportLabel = UILabel()
    var inboundDestAirportLabel = UILabel()
    
    var quote: Quote? {
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
        
        guard let price = quote?.minPrice,
        let direct = quote?.direct else {
            // Handle
            return
        }
        
        destinationLabel.text =  quote?.outboundDestinationCity
        priceLabel.text = "$\(price)"
        directLabel.text = direct ? "Non-stop" : "Stops"   // TODO: - Change to Non-stop or stops
        // dates.text = quote?.outboundDepartureDate + quote?.outboundDepartureDate // TODO: - format
        
        outboundCarrierLabel.text = quote?.outboundAirlines?.description // TODO: - Show each
        outboundDepartTimeLabel.text = ""
        outboundArrivalTimeLabel.text = ""
        outboundOriginAirportLabel.text = quote?.outboundOriginIata // TODO: - get airport name
        outboundDestAirportLabel.text = "\(quote?.outboundDestinationID)" //TODO: - get airport name
        
        inboundCarrierLabel.text = "\(quote?.inboundCarriers)"
        inboundDepartTimeLabel.text = ""
        inboundArrivalTimeLabel.text  = ""
        inboundOriginAirportLabel.text = "\(quote?.inboundOriginID)" // TODO: - get airport name
        inboundDestAirportLabel.text = "\(quote?.inboundDestinationID)" // TODO: - Get airport name
        
    }
    
    func constrain() {
        self.contentView.addSubview(destinationLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(directLabel)
        self.contentView.addSubview(datesLabel)
        self.contentView.addSubview(outboundCarrierLabel)
        self.contentView.addSubview(outboundDepartTimeLabel)
        self.contentView.addSubview(outboundArrivalTimeLabel)
        self.contentView.addSubview(outboundOriginAirportLabel)
        self.contentView.addSubview(outboundDestAirportLabel)
        self.contentView.addSubview(inboundCarrierLabel)
        self.contentView.addSubview(inboundDepartTimeLabel)
        self.contentView.addSubview(inboundArrivalTimeLabel)
        self.contentView.addSubview(inboundOriginAirportLabel)
        self.contentView.addSubview(inboundDestAirportLabel)
        
        priceLabel.textAlignment = .right
        directLabel.textAlignment = .right

        destinationLabel.textColor = UIColor.black
        priceLabel.textColor = UIColor.black
        outboundCarrierLabel.textColor = UIColor.darkGray
        outboundOriginAirportLabel.textColor = UIColor.black
        directLabel.textColor = UIColor.blue
        
        destinationLabel.font.withSize(14)
        priceLabel.font.withSize(12)
        outboundCarrierLabel.font.withSize(12)
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
        
        outboundCarrierLabel.snp.makeConstraints {
            $0.top.equalTo(destinationLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        outboundOriginAirportLabel.snp.makeConstraints {
            $0.top.equalTo(outboundCarrierLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        directLabel.snp.makeConstraints {
            $0.top.equalTo(outboundCarrierLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        
    }
    
    override func prepareForReuse() {
        destinationLabel.text = nil
        outboundCarrierLabel.text = nil
        outboundOriginAirportLabel.text = nil
            }

}

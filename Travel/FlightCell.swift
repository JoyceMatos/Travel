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
    
    let destinationLabel = UILabel()
    let priceLabel = UILabel()
    let directLabel = UILabel()
    let datesLabel = UILabel()
    let outboundCarrierLabel = UILabel()
    let outboundDepartTimeLabel = UILabel()
    let outboundArrivalTimeLabel = UILabel()
    let outboundOriginAirportLabel = UILabel()
    let outboundDestAirportLabel = UILabel()
    let inboundCarrierLabel = UILabel()
    let inboundDepartTimeLabel = UILabel()
    let inboundArrivalTimeLabel = UILabel()
    let inboundOriginAirportLabel = UILabel()
    let inboundDestAirportLabel = UILabel()
    
    var quote: Quote? {
        didSet {
                configureLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        configureLabels() // For testing purposes
        constrain()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   func configureLabels() {
    destinationLabel.text =  "San Jose" //"\(quote?.outboundOriginID)" // TODO:- Change to origin name
    priceLabel.text = "\(quote?.minPrice)"
    directLabel.text = "\(quote?.direct)"   // TODO: - Change to Non-stop or stops
   // dates.text = quote?.outboundDepartureDate + quote?.outboundDepartureDate // TODO: - format
    
    outboundCarrierLabel.text = "\(quote?.outboundCarriers)" // TODO: - Show each
    outboundDepartTimeLabel.text = ""
    outboundArrivalTimeLabel.text = ""
    outboundOriginAirportLabel.text = "\(quote?.outboundOriginID)" // TODO: - get airport name
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
        
        destinationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(40)
            $0.height.equalToSuperview().multipliedBy(0.1)
            $0.width.equalToSuperview().multipliedBy(0.8
            )
        }
        


        
    }

}
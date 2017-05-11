//
//  FlightCell.swift
//  Travel
//
//  Created by Joyce Matos on 5/11/17.
//  Copyright © 2017 Joyce Matos. All rights reserved.
//

import UIKit


class FlightCell: UITableViewCell {
    
    let destinationLabel = UILabel()
    let priceLabel = UILabel()
    let directLabel = UILabel()
    let dates = UILabel()
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
    
    weak var quote: Quote? {
        didSet {
                configureLabels()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   func configureLabels() {
    destinationLabel.text = quote?.outboundOriginID // TODO:- Change to origin name
    priceLabel.text = quote?.minPrice
    directLabel.text = quote?.direct    // TODO: - Change to Non-stop or stops
    dates.text = quote?.outboundDepartureDate + quote?.outboundDepartureDate // TODO: - format 
    
    outboundCarrierLabel.text = quote?.outboundCarriers // TODO: - Show each
    outboundDepartTimeLabel.text = ""
    outboundArrivalTimeLabel.text = ""
    outboundOriginAirportLabel.text = quote?.outboundOriginID // TODO: - get airport name
    outboundDestAirportLabel.text = quote?.outboundDestinationID //TODO: - get airport name
    
    inboundCarrierLabel.text = quote?.inboundCarriers
    inboundDepartTimeLabel.text = ""
    inboundArrivalTimeLabel.text  = ""
    inboundOriginAirportLabel.text = quote?.inboundOriginID // TODO: - get airport name
    inboundDestAirportLabel.text = quote?.inboundDestinationID // TODO: - Get airport name
    
    }

}

//
//  HourlyForecastTableViewCell.swift
//  OpenWeatherApp
//
//  Created by IrishAle on 03/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class HourlyForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(withViewModel viewModel: FutureForecastViewModel) {
        weatherImageView.image = UIImage(data: viewModel.weatherIconData ?? Data())
        temperatureLabel.text = viewModel.temperature
        titleLabel.text = viewModel.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

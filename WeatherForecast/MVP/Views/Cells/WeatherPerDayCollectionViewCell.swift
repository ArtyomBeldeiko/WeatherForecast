//
//  WeatherPerDayCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 4.12.22.
//

import UIKit

class WeatherPerDayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WeatherPerDayCollectionViewCell"
    
    let timeStampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 14)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherType: UILabel = {
        let imageView = UILabel()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(timeStampLabel)
        contentView.addSubview(weatherType)
        contentView.addSubview(temperatureLabel)
        setConstraints()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        timeStampLabel.frame = contentView.bounds
        weatherType.frame = contentView.bounds
        temperatureLabel.frame = contentView.bounds
    }
    
    private func setConstraints() {
        let timeStampLabelConstraints = [
            timeStampLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            timeStampLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ]
        
        let weatherTypeConstraints = [
            weatherType.heightAnchor.constraint(equalToConstant: 28),
            weatherType.widthAnchor.constraint(equalToConstant: 28),
            weatherType.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            weatherType.topAnchor.constraint(equalTo: timeStampLabel.bottomAnchor, constant: 3.09)
        ]
        
        let temperatureLabel = [
            temperatureLabel.topAnchor.constraint(equalTo: weatherType.bottomAnchor, constant: 2.94),
            temperatureLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(timeStampLabelConstraints)
        NSLayoutConstraint.activate(weatherTypeConstraints)
        NSLayoutConstraint.activate(temperatureLabel)
    }
}

//
//  LowerTableViewCell.swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 5.12.22.
//

import UIKit

class LowerTableViewCell: UITableViewCell {

    static let identifier = "LowerTableViewCell"
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherTypeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nightTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.584, green: 0.631, blue: 0.694, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dayTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(weatherTypeImageView)
        contentView.addSubview(nightTemperatureLabel)
        contentView.addSubview(dayTemperatureLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        let dayLabelConstraints = [
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
        ]
        
        let weatherTypeImageViewConstraints = [
            weatherTypeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherTypeImageView.heightAnchor.constraint(equalToConstant: 28),
            weatherTypeImageView.widthAnchor.constraint(equalToConstant: 28),
            weatherTypeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 130)
        ]
        
        let nightTemperatureLabelConstraints = [
            nightTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nightTemperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 220)
        ]
        
        let dayTemperatureLabelConstraints = [
            dayTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayTemperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(dayLabelConstraints)
        NSLayoutConstraint.activate(weatherTypeImageViewConstraints)
        NSLayoutConstraint.activate(nightTemperatureLabelConstraints)
        NSLayoutConstraint.activate(dayTemperatureLabelConstraints)
    }
}

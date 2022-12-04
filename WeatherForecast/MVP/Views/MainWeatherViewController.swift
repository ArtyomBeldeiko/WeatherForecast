//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 2.12.22.
//

import UIKit

class MainWeatherViewController: UIViewController {
    
    private let presenter = WeatherPresenter()
    private var weatherData: Welcome?
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 30)
        label.textColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.textColor = UIColor(red: 209 / 255, green: 213 / 255, blue: 217 / 255, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.textColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let upperTableViewPlaceSection: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 60 / 255, green: 78 / 255, blue: 101 / 255, alpha: 0.6)
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailedWeatherInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 14)
        label.textColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let upperTableViewPlaceSectionSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 110 / 255, green: 120 / 255, blue: 135 / 255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let upperTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let lowerTableViewPlaceSection: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 60 / 255, green: 78 / 255, blue: 101 / 255, alpha: 0.6)
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let lowerTableViewSectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 14)
        label.textColor = UIColor(red: 149 / 255, green: 161 / 255, blue: 177 / 255, alpha: 1)
        label.text = "10-DAY FORECAST"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lowerTableViewPlaceSectionSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 110 / 255, green: 120 / 255, blue: 135 / 255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lowerTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        
        presenter.setViewDelegate(delegate: self)
        presenter.getWeatherData()
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        upperTableViewPlaceSection.addBlurEffect()
//        lowerTableViewPlaceSection.addBlurEffect()
//    }
    
    private func addSubviews() {
        self.view.addSubview(backgroundImage)
        self.view.addSubview(cityLabel)
        self.view.addSubview(temperatureLabel)
        self.view.addSubview(weatherTypeLabel)
        self.view.addSubview(upperTableViewPlaceSection)
        self.view.addSubview(detailedWeatherInfoLabel)
        self.view.addSubview(upperTableViewPlaceSectionSeparator)
        self.view.addSubview(upperTableView)
        self.view.addSubview(lowerTableViewPlaceSection)
        self.view.addSubview(calendarImageView)
        self.view.addSubview(lowerTableViewSectionLabel)
        self.view.addSubview(lowerTableViewPlaceSectionSeparator)
        self.view.addSubview(lowerTableView)
    }
    
    private func setConstraints() {
        let backgroundImageConstraints = [
            backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        let cityLabelConstraints = [
            cityLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60.72),
            cityLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        let temperatureLabelConstraints = [
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7.78),
            temperatureLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 139.5)
        ]
        
        let weatherTypeLabelConstraints = [
            weatherTypeLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 6.28),
            weatherTypeLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 5)
        ]
        
        let upperTableViewPlaceSectionConstraints = [
            upperTableViewPlaceSection.topAnchor.constraint(equalTo: weatherTypeLabel.bottomAnchor, constant: 57),
            upperTableViewPlaceSection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            upperTableViewPlaceSection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -23),
            upperTableView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        let detailedWeatherInfoLabelConstraints = [
            detailedWeatherInfoLabel.topAnchor.constraint(equalTo: upperTableViewPlaceSection.topAnchor, constant: 14),
            detailedWeatherInfoLabel.heightAnchor.constraint(equalToConstant: 36),
            detailedWeatherInfoLabel.leadingAnchor.constraint(equalTo: upperTableViewPlaceSection.leadingAnchor, constant: 14),
            detailedWeatherInfoLabel.trailingAnchor.constraint(equalTo: upperTableViewPlaceSection.trailingAnchor, constant: -15)
        ]
        
        let upperTableViewPlaceSectionSeparatorConstraints = [
            upperTableViewPlaceSectionSeparator.topAnchor.constraint(equalTo: detailedWeatherInfoLabel.bottomAnchor, constant: 14),
            upperTableViewPlaceSectionSeparator.leadingAnchor.constraint(equalTo: detailedWeatherInfoLabel.leadingAnchor),
            upperTableViewPlaceSectionSeparator.trailingAnchor.constraint(equalTo: detailedWeatherInfoLabel.trailingAnchor),
            upperTableViewPlaceSectionSeparator.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let upperTableViewContraints = [
            upperTableView.topAnchor.constraint(equalTo: upperTableViewPlaceSectionSeparator.bottomAnchor, constant: 12),
            upperTableView.bottomAnchor.constraint(equalTo: upperTableViewPlaceSection.bottomAnchor, constant: -13.97),
            upperTableView.leadingAnchor.constraint(equalTo: detailedWeatherInfoLabel.leadingAnchor),
            upperTableView.trailingAnchor.constraint(equalTo: detailedWeatherInfoLabel.trailingAnchor)
        ]
        
        let lowerTableViewPlaceSectionConstraints = [
            lowerTableViewPlaceSection.topAnchor.constraint(equalTo: upperTableViewPlaceSection.bottomAnchor, constant: 9),
            lowerTableViewPlaceSection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            lowerTableViewPlaceSection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            lowerTableViewPlaceSection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24)
        ]
        
        let calendarImageViewContraints = [
            calendarImageView.topAnchor.constraint(equalTo: lowerTableViewPlaceSection.topAnchor, constant: 15.5),
            calendarImageView.leadingAnchor.constraint(equalTo: lowerTableViewPlaceSection.leadingAnchor, constant: 16),
            calendarImageView.widthAnchor.constraint(equalToConstant: 14),
            calendarImageView.heightAnchor.constraint(equalToConstant: 14)
        ]
        
        let lowerTableViewSectionLabelConstraints = [
            lowerTableViewSectionLabel.topAnchor.constraint(equalTo: lowerTableViewPlaceSection.topAnchor, constant: 14),
            lowerTableViewSectionLabel.heightAnchor.constraint(equalToConstant: 17),
            lowerTableViewSectionLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 7)
        ]
        
        let lowerTableViewPlaceSectionSeparatorConstraints = [
            lowerTableViewPlaceSectionSeparator.topAnchor.constraint(equalTo: lowerTableViewSectionLabel.bottomAnchor, constant: 14),
            lowerTableViewPlaceSectionSeparator.leadingAnchor.constraint(equalTo: lowerTableViewPlaceSection.leadingAnchor, constant: 14),
            lowerTableViewPlaceSectionSeparator.trailingAnchor.constraint(equalTo: lowerTableViewPlaceSection.trailingAnchor, constant: -14),
            lowerTableViewPlaceSectionSeparator.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let lowerTableViewConstraints = [
            lowerTableView.topAnchor.constraint(equalTo: lowerTableViewPlaceSectionSeparator.bottomAnchor, constant: 11.5),
            lowerTableView.leadingAnchor.constraint(equalTo: lowerTableViewPlaceSection.leadingAnchor, constant: 14),
            lowerTableView.trailingAnchor.constraint(equalTo: lowerTableViewPlaceSection.trailingAnchor, constant: -14),
            lowerTableView.bottomAnchor.constraint(equalTo: lowerTableViewPlaceSection.bottomAnchor, constant: -33.08)
        ]
        
        NSLayoutConstraint.activate(backgroundImageConstraints)
        NSLayoutConstraint.activate(cityLabelConstraints)
        NSLayoutConstraint.activate(temperatureLabelConstraints)
        NSLayoutConstraint.activate(weatherTypeLabelConstraints)
        NSLayoutConstraint.activate(upperTableViewPlaceSectionConstraints)
        NSLayoutConstraint.activate(detailedWeatherInfoLabelConstraints)
        NSLayoutConstraint.activate(upperTableViewPlaceSectionSeparatorConstraints)
        NSLayoutConstraint.activate(upperTableViewContraints)
        NSLayoutConstraint.activate(lowerTableViewPlaceSectionConstraints)
        NSLayoutConstraint.activate(calendarImageViewContraints)
        NSLayoutConstraint.activate(lowerTableViewSectionLabelConstraints)
        NSLayoutConstraint.activate(lowerTableViewPlaceSectionSeparatorConstraints)
        NSLayoutConstraint.activate(lowerTableViewConstraints)
    }
}

// MARK: WeatherPresenterDelegate

extension MainWeatherViewController: WeatherPresenterDelegate {
    func presentData(data: Welcome) {
        weatherData = data
        
        DispatchQueue.main.async {
            self.upperTableView.reloadData()
            self.lowerTableView.reloadData()
        }
    }
}


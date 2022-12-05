//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 3.12.22.
//

import Foundation
import UIKit


struct WeatherData: Codable {
    let city, temperature, welcomeDescription: String
    let weatherPerDay: [WeatherPerDay]
    let forecast: [Forecast]

    enum CodingKeys: String, CodingKey {
        case city, temperature
        case welcomeDescription = "description"
        case weatherPerDay = "weather_per_day"
        case forecast
    }
}

struct Forecast: Codable {
    let date: String
    let minTemperature, maxTemperature: Int
    let weatherType: String

    enum CodingKeys: String, CodingKey {
        case date
        case minTemperature = "min_temperature"
        case maxTemperature = "max_temperature"
        case weatherType = "weather_type"
    }
    
    var weatherTypeIcon: UIImage {
        switch weatherType {
        case "0": return UIImage(systemName: "cloud.fill")!
        case "1": return UIImage(systemName: "sun.max.fill")!
        case "2": return UIImage(systemName: "cloud.sun.fill")!
        case "3": return UIImage(systemName: "cloud.snow.fill")!
        default: return UIImage(systemName: "questionmark.circle.fill")!
        }
    }
}

struct WeatherPerDay: Codable {
    let timestamp, weatherType, temperature: String
    let sunset: Bool?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case weatherType = "weather_type"
        case temperature, sunset
    }
    
    var weatherTypeIcon: UIImage {
        switch weatherType {
        case "0": return UIImage(systemName: "cloud.fill")!
        case "1": return UIImage(systemName: "sun.max.fill")!
        case "2": return UIImage(systemName: "cloud.sun.fill")!
        case "3": return UIImage(systemName: "cloud.snow.fill")!
        default: return UIImage(systemName: "questionmark.circle.fill")!
        }
    }
}

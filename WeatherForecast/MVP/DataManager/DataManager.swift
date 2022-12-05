//
//  DataManager.swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 4.12.22.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    func loadData(filename fileName: String) -> WeatherData? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(WeatherData.self, from: data)
                return jsonData
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        return nil
    }
}

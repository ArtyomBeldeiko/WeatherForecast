//
//  WeatherPresenter.swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 4.12.22.
//

import Foundation
import UIKit

protocol WeatherPresenterDelegate: AnyObject {
    func presentData(data: WeatherData)
}

typealias PresenterDelegate = WeatherPresenterDelegate & UIViewController 

class WeatherPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getWeatherData() {
        guard let data = DataManager.shared.loadData(filename: "TestTaskJSON") else { return }
        self.delegate?.presentData(data: data)
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
